# Ibis4Integration ( or Ibis with Eddie, Ibis for Devops......)

## Purpose
This project has as purpose to investigate the possibilite to add an editor to the Ibis Adapter Framework. This addition would prove useful when it would be possible to quickly modify, download, and upload ibis configurations, thereby creating a smooth flow of events while testing, developing, and debugging.

* Clone the project into a local repository and import it as a Maven project into Eclipse; add it as a web module to Tomcat.
* In src/main/resources/databasechangelog the ibisconfig table is made to store newly uploaded configs via the database classloader system. Also an empty zipped configuration is loaded via this script.
* run the Ibis from Eclipse ; within the menu 'Configurations' you will have the option to add a new configuration. For now this configuration must be under a static name 'Ibis4Teacher'; also you have now the option to edit an existing configuration. The Editor will show up immediately. When you finish editing you can push the upper right pink paper plane button to upload it to the database. 
* The reload sender triggers every minute, so your config is probably not loaded immediately. To fasten this process you can push the reload button in the adapterstatus menu in the gui.



## TODOS
* Make Eddie Stateless
* Repair doubled tabs within the manage configurations menu
* Have a decent code review
* Develop a beta version of an integrated (devops) editor
* Only tested with the built-in H2 database

