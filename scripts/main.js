var mappings = [];
var numMappings = 0;

var mappingsList = document.getElementById('mappings-list');
var saveButton   = document.getElementById('save-mappings-button');
var newButton    = document.getElementById('new-mapping-button');


function createMapping() {
  // Create a new mapping list element
  let index = mappings.length;
  let mapping = document.createElement('li');
  mapping.classList.add('list-group-item', 'row');
  mappings[index] = {
    node: mapping,
    id: {
      node: document.createElement('div'),
      value: '',
      valid: false
    },
    dot: {
      node: document.createElement('div'),
      value: 3,
      valid: true
    },
    dir: {
      node: document.createElement('div'),
      value: 3,
      valid: true
    },
    instruction: {
      node: document.createElement('div'),
      value: '',
      valid: false
    },
    data: {
      node: document.createElement('div'),
      value: '',
      valid: false
    }
  };


  // ID Input
  mappings[index].id.node.classList.add('col-sm-2');
  mapping.appendChild(mappings[index].id.node);
  let idGroup = document.createElement('div');
  idGroup.classList.add('input-group');
  mappings[index].id.node.appendChild(idGroup);
  let idAddon = document.createElement('span');
  idAddon.classList.add('input-group-addon');
  idAddon.textContent = '0x';
  idAddon.id = `mapping-${index}-id`;
  idGroup.appendChild(idAddon);
  let idInput = document.createElement('input');
  idInput.classList.add('form-control');
  idInput.setAttribute('type', 'text');
  idInput.setAttribute('minlength', '4');
  idInput.setAttribute('maxlength', '4');
  idInput.setAttribute('pattern', '[0-9A-Fa-f]{4}');
  idInput.setAttribute('placeholder', 'Beacon ID');
  idInput.setAttribute('aria-describedby', `mapping-${index}-id`);
  idInput.addEventListener('input', function(e) {
    if (/^[0-9A-F]{0,4}$/i.test(e.target.value)) {
      mappings[index].id.value = e.target.value;
      mappings[index].id.valid = !e.target.validity.patternMismatch;

      if (mappings[index].id.valid) {
        mappings[index].id.node.classList.remove('has-danger');
      }
    } else {
      e.target.value = mappings[index].id.value;
    }
  });
  idGroup.appendChild(idInput);


  // Direction Inputs
  for (let title of [['dot', 'Travel Direction'], ['dir', 'Train Direction']]) {
    mappings[index][title[0]].node.classList.add('col-sm-auto');
    mapping.appendChild(mappings[index][title[0]].node);
    let inputCard = document.createElement('div');
    inputCard.classList.add('card');
    mappings[index][title[0]].node.appendChild(inputCard);
    let inputBlock = document.createElement('div');
    inputBlock.classList.add('card-block', 'custom-card-block');
    inputCard.appendChild(inputBlock);
    let inputTitle = document.createElement('span');
    inputTitle.classList.add('custom-title');
    inputTitle.textContent = title[1];
    inputBlock.appendChild(inputTitle);

    for (let dir of [[0, 'F'], [1, 'R']]) {
      let inputLabel = document.createElement('label');
      inputLabel.classList.add('custom-control', 'custom-checkbox', 'custom-label');
      inputBlock.appendChild(inputLabel);
      let input = document.createElement('input');
      input.classList.add('custom-control-input');
      input.setAttribute('type', 'checkbox');
      input.setAttribute('checked', '');
      input.addEventListener('change', function(e) {
        if (e.target.checked) {
          mappings[index][title[0]].value |=  (1 << dir[0]);
        } else {
          mappings[index][title[0]].value &= ~(1 << dir[0]);
        }

        if (mappings[index][title[0]].value === 0) {
          mappings[index][title[0]].node.classList.add('has-warning');
        } else {
          mappings[index][title[0]].node.classList.remove('has-warning');
        }
      });
      inputLabel.appendChild(input);
      let inputIndicator = document.createElement('span');
      inputIndicator.classList.add('custom-control-indicator');
      inputLabel.appendChild(inputIndicator);
      let inputDescription = document.createElement('span');
      inputDescription.classList.add('custom-control-description');
      inputDescription.textContent = dir[1];
      inputLabel.appendChild(inputDescription);
    }
  }


  // Instruction Input
  mappings[index].instruction.node.classList.add('col-sm-auto');
  mapping.appendChild(mappings[index].instruction.node);
  let instructionLegend = document.createElement('legend');
  instructionLegend.classList.add('col-form-legend', 'sr-only');
  instructionLegend.textContent = 'Function';
  mappings[index].instruction.node.appendChild(instructionLegend);
  let instructionSelect = document.createElement('select');
  instructionSelect.classList.add('custom-select');
  instructionSelect.addEventListener('change', function(e) {
    mappings[index].instruction.value = e.target.value;
    mappings[index].instruction.valid = e.target.value >= 0 && e.target.value < 32;
    if (mappings[index].instruction.valid) {
      mappings[index].instruction.node.classList.remove('has-danger');
    }
  });
  mappings[index].instruction.node.appendChild(instructionSelect);
  let instructionSelected = document.createElement('option');
  instructionSelected.setAttribute('selected', '');
  instructionSelected.setAttribute('disabled', '');
  instructionSelected.textContent = 'Function';
  instructionSelect.appendChild(instructionSelected);
  for (let f = 0; f <= 28; f++) {
    let instructionOption = document.createElement('option');
    instructionOption.setAttribute('value', f);
    instructionOption.textContent = `F${f}`;
    instructionSelect.appendChild(instructionOption);
  }
  let instructionSpeed = document.createElement('option');
  instructionSpeed.setAttribute('value', 29);
  instructionSpeed.textContent = 'Speed';
  instructionSelect.appendChild(instructionSpeed);
  let instructionDirection = document.createElement('option');
  instructionDirection.setAttribute('value', 30);
  instructionDirection.textContent = 'Direction';
  instructionSelect.appendChild(instructionDirection);
  let instructionCustom = document.createElement('option');
  instructionCustom.setAttribute('value', 31);
  instructionCustom.textContent = 'Custom';
  instructionSelect.appendChild(instructionCustom);


  // Data Input
  mappings[index].data.node.classList.add('col-sm-2');
  mapping.appendChild(mappings[index].data.node);
  let dataLabel = document.createElement('label');
  dataLabel.classList.add('sr-only');
  dataLabel.setAttribute('for', `mapping-${index}-data`);
  dataLabel.textContent = 'Data';
  mappings[index].data.node.appendChild(dataLabel);
  let dataInput = document.createElement('input');
  dataInput.classList.add('form-control');
  dataInput.setAttribute('type', 'number');
  dataInput.setAttribute('min', '0');
  dataInput.setAttribute('max', '127');
  // dataInput.setAttribute('value', '0');
  dataInput.setAttribute('placeholder', 'Data');
  dataInput.id = `mapping-${index}-data`;
  dataInput.addEventListener('input', function(e) {
    if (e.target.validity.badInput ||
        e.target.validity.rangeUnderflow ||
        e.target.validity.rangeOverflow) {
      e.target.value = mappings[index].data.value;
    } else {
      mappings[index].data.value = e.target.value;
      mappings[index].data.valid = true;
      mappings[index].data.node.classList.remove('has-danger');
    }
  });
  mappings[index].data.node.appendChild(dataInput);


  // Spacer
  let spacer = document.createElement('div');
  spacer.classList.add('col');
  mapping.appendChild(spacer);


  // Delete Button
  let deleteButton = document.createElement('button');
  deleteButton.classList.add('close');
  deleteButton.setAttribute('type', 'button');
  deleteButton.setAttribute('aria-label', 'Delete');
  deleteButton.addEventListener('click', function() {
    if (index == mappings.length - 1) {
      mappings.pop();
    } else {
      delete mappings[index];
    }
    mappingsList.removeChild(mapping);
    numMappings--;

    if (numMappings === 0) {
      mappings = [];
      saveButton.setAttribute('disabled', '');
    }
  });
  mapping.appendChild(deleteButton);
  let deleteButtonSpan = document.createElement('span');
  deleteButtonSpan.setAttribute('aria-hidden', 'true');
  deleteButtonSpan.textContent = '×';
  deleteButton.appendChild(deleteButtonSpan);

  // Append the new mapping to the mappings list
  mappingsList.appendChild(mapping);
  numMappings++;

  if (numMappings === 1) {
    saveButton.removeAttribute('disabled');
  }
}


// saveButton.setAttribute('disabled', '');
saveButton.addEventListener('click', function() {
  let buffer = new ArrayBuffer((2 + numMappings) * 4);
  let data = new DataView(buffer);
  data.setUint32(0, 0);
  data.setUint32(4, numMappings);

  let m = 2;
  let valid = true;
  for (let mapping of mappings) {
    if (mapping) {
      for (let i in mapping) {
        if (mapping[i].valid === false) {
          mapping[i].node.classList.add('has-danger');
          valid = false;
        }
      }
      if (valid) {
        data.setUint32(m * 4, (parseInt(mapping.id.value, 16) << 16) |
                  (mapping.dot.value << 14) | (mapping.dir.value << 12) |
                  (mapping.instruction.value << 7) | mapping.data.value);
      }
      m++;
    }
  }

  if (valid) {
    saveAs(new Blob([data], {type: 'application/octet-stream'}), 'mappings.dat');
    // alert('Save downloaded file to locomotive storage device');
  }
});

newButton.addEventListener('click', createMapping);
createMapping();
