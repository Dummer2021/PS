(net stop ***-POSTMAN3 
(tasklist | find "IManager.exe" && taskkill /F /im IManager.exe) || (echo FALSE)
(tasklist | find "DMCtrl.exe" && taskkill /F /im DMCtrl.exe) || (echo FALSE)
net stop ***-IMANAGER 
net stop ***-VELESCTRL3 
net stop ***-DMCTRL3 
net stop ***-ATMCOMMANDER 
net stop ***-WPCTRL3 
net stop ***-EDCTRL3 
net stop ***-RMANAGER 
(tasklist | find "AtmCommander.exe" && taskkill /F /im AtmCommander.exe) || (echo FALSE)
net stop ***-SERVICEMANAGER3 ) || (net start ***-SERVICEMANAGER3)