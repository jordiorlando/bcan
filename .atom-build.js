module.exports = {
  cmd: 'make',
  name: 'make all',
  args: [
    'all'
  ],
  cwd: '{FILE_ACTIVE_PATH}',
  preBuild: function() {
    const path = require('path');
    const editor = atom.workspace.getActiveTextEditor();

    const projectPaths = atom.project.getPaths().map(projectPath => {
      try {
        return fs.realpathSync(projectPath);
      } catch (e) { /* Do nothing. */ }
      return null;
    });

    const replacements = {
      PROJECT_PATH: projectPaths[0]
    };

    if (editor && (undefined !== editor.getPath())) {
      replacements.FILE_ACTIVE = fs.realpathSync(editor.getPath());
      replacements.FILE_ACTIVE_PATH = path.dirname(replacements.FILE_ACTIVE);
      replacements.PROJECT_PATH = projectPaths.find(p => replacements.FILE_ACTIVE_PATH && replacements.FILE_ACTIVE_PATH.startsWith(p));
      replacements.FILE_ACTIVE_NAME = path.basename(replacements.FILE_ACTIVE);
      replacements.FILE_ACTIVE_NAME_BASE = path.basename(replacements.FILE_ACTIVE, path.extname(replacements.FILE_ACTIVE));
      replacements.SELECTION = editor.getSelectedText();
    }
    if (atom.project.getRepositories[0]) {
      replacements.REPO_BRANCH_SHORT = atom.project.getRepositories()[0].getShortHead();
    }

    let subPath = replacements.FILE_ACTIVE_PATH.replace(replacements.PROJECT_PATH, '');
    for (let dir of ['beacon', 'locomotive']) {
      if (subPath.startsWith('/firmware/' + dir)) {
        this.cwd = replacements.PROJECT_PATH + '/firmware/' + dir;
      }
    }
  },
  targets: {
    'beacon make': {
      cmd: 'make',
      args: [
        'all',
        'ID=0xbcaf'
      ],
      cwd: '{PROJECT_PATH}/firmware/beacon',
      preBuild: function() {
        let id = parseInt(editor.getSelectedText(), 16);
        if (!isNaN(id)) {
          this.args[1] = this.args[1].replace('bcaf', id.toString(16).substr(0, 4));
        }
      }
    },
    'beacon make program': {
      cmd: 'make',
      args: [
        'program',
        'AVRDUDE_PROGRAMMER=avrisp2',
        'ID=0xbcaf'
      ],
      cwd: '{PROJECT_PATH}/firmware/beacon',
      preBuild: function() {
        let id = parseInt(editor.getSelectedText(), 16);
        if (!isNaN(id)) {
          this.args[2] = this.args[2].replace('bcaf', id.toString(16).substr(0, 4));
        }
      }
    },
    'locomotive make': {
      'cmd': 'make',
      args: [
        'all'
      ],
      cwd: '{PROJECT_PATH}/firmware/locomotive'
    },
    'locomotive make flash': {
      'cmd': 'make',
      args: [
        'flash'
      ],
      cwd: '{PROJECT_PATH}/firmware/locomotive'
    }
  }
};
