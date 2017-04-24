module.exports = {
  cmd: 'make',
  name: 'make all',
  args: [
    'all'
  ],
  cwd: '{FILE_ACTIVE_PATH}',
  preBuild: function(replacements) {
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
      preBuild: function(replacements) {
        let id = parseInt(replacements.SELECTION, 16);
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
      preBuild: function(replacements) {
        let id = parseInt(replacements.SELECTION, 16);
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
