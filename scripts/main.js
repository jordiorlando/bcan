var lastMapping = 0;
var numMappings = 0;

var mappingsList       = document.getElementById('mappings-list');
var saveMappingsButton = document.getElementById('save-mappings-button');
var newMappingButton   = document.getElementById('new-mapping-button');



saveMappingsButton.addEventListener('click', function(e) {
  alert('Save downloaded file to locomotive storage device');
});

newMappingButton.addEventListener('click', function(e) {
  let newMapping = document.createElement('li');
  newMapping.classList.add('list-group-item', 'row');

  let idInputWrapper = document.createElement('div');
  idInputWrapper.classList.add('col-sm-2');
  newMapping.appendChild(idInputWrapper);
  let idInputGroup = document.createElement('div');
  idInputGroup.classList.add('input-group');
  idInputWrapper.appendChild(idInputGroup);
  let idInputAddon = document.createElement('span');
  idInputAddon.classList.add('input-group-addon');
  idInputAddon.textContent = '0x';
  idInputAddon.id = `mapping-${lastMapping}-id`;
  idInputGroup.appendChild(idInputAddon);
  let idInput = document.createElement('input');
  idInput.classList.add('form-control');
  idInput.setAttribute('type', 'text');
  idInput.setAttribute('placeholder', 'Beacon ID');
  idInput.setAttribute('aria-describedby', `mapping-${lastMapping}-id`);
  idInputGroup.appendChild(idInput);

  for (let title of ['Travel Direction', 'Train Direction']) {
    let dirInputWrapper = document.createElement('div');
    dirInputWrapper.classList.add('col-sm-auto');
    newMapping.appendChild(dirInputWrapper);
    let dirInputCard = document.createElement('div');
    dirInputCard.classList.add('card');
    dirInputWrapper.appendChild(dirInputCard);
    let dirInputCardBlock = document.createElement('div');
    dirInputCardBlock.classList.add('card-block', 'custom-card-block');
    dirInputCard.appendChild(dirInputCardBlock);
    let dirInputTitle = document.createElement('span');
    dirInputTitle.textContent = title;
    dirInputCardBlock.appendChild(dirInputTitle);

    for (let dir of ['F', 'R']) {
      let dirInputLabel = document.createElement('label');
      dirInputLabel.classList.add('custom-control', 'custom-checkbox', 'custom-label');
      dirInputCardBlock.appendChild(dirInputLabel);
      let dirInput = document.createElement('input');
      dirInput.classList.add('custom-control-input');
      dirInput.setAttribute('type', 'checkbox');
      dirInput.setAttribute('checked', '');
      dirInputLabel.appendChild(dirInput);
      let dirInputIndicator = document.createElement('span');
      dirInputIndicator.classList.add('custom-control-indicator');
      dirInputLabel.appendChild(dirInputIndicator);
      let dirInputDescription = document.createElement('span');
      dirInputDescription.classList.add('custom-control-description');
      dirInputDescription.textContent = dir;
      dirInputLabel.appendChild(dirInputDescription);
    }
  }

  let functionInputWrapper = document.createElement('div');
  functionInputWrapper.classList.add('col-sm-auto');
  newMapping.appendChild(functionInputWrapper);
  let functionInputLegend = document.createElement('legend');
  functionInputLegend.classList.add('col-form-legend', 'sr-only');
  functionInputLegend.textContent = 'Function';
  functionInputWrapper.appendChild(functionInputLegend);
  let functionInputSelect = document.createElement('select');
  functionInputSelect.classList.add('custom-select');
  functionInputWrapper.appendChild(functionInputSelect);
  let functionInputSelected = document.createElement('option');
  functionInputSelected.setAttribute('selected', '');
  functionInputSelected.setAttribute('disabled', '');
  functionInputSelected.textContent = 'Function';
  functionInputSelect.appendChild(functionInputSelected);
  let functionInputSpeed = document.createElement('option');
  functionInputSpeed.setAttribute('value', '0');
  functionInputSpeed.textContent = 'Speed';
  functionInputSelect.appendChild(functionInputSpeed);

  for (let f = 1; f < 29; f++) {
    let functionInputOption = document.createElement('option');
    functionInputOption.setAttribute('value', f);
    functionInputOption.textContent = `F${f}`;
    functionInputSelect.appendChild(functionInputOption);
  }

  let functionInputCustom = document.createElement('option');
  functionInputCustom.setAttribute('value', '31');
  functionInputCustom.textContent = 'Custom';
  functionInputSelect.appendChild(functionInputCustom);

  let dataInputWrapper = document.createElement('div');
  dataInputWrapper.classList.add('col-sm-2');
  newMapping.appendChild(dataInputWrapper);
  let dataInputLabel = document.createElement('label');
  dataInputLabel.classList.add('sr-only');
  dataInputLabel.setAttribute('for', `mapping-${lastMapping}-data`);
  dataInputLabel.textContent = 'Data';
  dataInputWrapper.appendChild(dataInputLabel);
  let dataInput = document.createElement('input');
  dataInput.classList.add('form-control');
  dataInput.setAttribute('type', 'number');
  dataInput.setAttribute('placeholder', 'Data');
  dataInput.id = `mapping-${lastMapping}-data`;
  dataInputWrapper.appendChild(dataInput);

  let spacer = document.createElement('div');
  spacer.classList.add('col');
  newMapping.appendChild(spacer);

  let deleteMappingButton = document.createElement('button');
  deleteMappingButton.classList.add('close');
  deleteMappingButton.setAttribute('type', 'button');
  deleteMappingButton.setAttribute('aria-label', 'Delete');
  deleteMappingButton.addEventListener('click', function(e) {
    mappingsList.removeChild(newMapping);
    numMappings--;

    if (numMappings === 0) {
      saveMappingsButton.setAttribute('disabled', '');
    }
  });
  newMapping.appendChild(deleteMappingButton);
  let deleteMappingButtonSpan = document.createElement('span');
  deleteMappingButtonSpan.setAttribute('aria-hidden', 'true');
  deleteMappingButtonSpan.textContent = '×';
  deleteMappingButton.appendChild(deleteMappingButtonSpan);

  mappingsList.appendChild(newMapping);
  lastMapping++;
  numMappings++;

  if (numMappings === 1) {
    saveMappingsButton.removeAttribute('disabled');
  }
});
