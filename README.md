# Ibis4Integration ( or Ibis with Eddie, Ibis for Devops......)

## Purpose
This project has as purpose to investigate the possibilite to add an editor to the Ibis Adapter Framework. This addition would prove useful when it would be possible to quickly modify, download, and upload ibis configurations, thereby creating a smooth flow of events while testing, developing, and debugging.

*from the folder src/main/webapp/iaf/editor/app run bower install to have internal functionality like codemirror goodies, zip functionality, local saving, and so on.
*from the folder src/main/webapp/iaf/editor run npm install to have the gulp functionality; run gulp watch for just the editor;
*In databasechangelog the ibisconfig table is made to store newly uploaded configs via the database classloader system. Also an empty zipped configuration is loaded
*run the Ibis from Eclipse ; within the menu 'Configurations' you will have the option to add a new configuration. For now this configuration must be under a static name 'Ibis4Teacher';

##TODOS
*Make Eddie Stateless
*Repair doubled tabs within the manage configurations menu
*Have a decent code review
*Develop a beta version of an integrated (devops) editor
