# School management project

## Setup

### Open the credentials of the app with vim editor (make sure that you have the master.key file for encrypt the config/credentials.yml.enc file)

```bash
EDITOR=vim rails credentials:edit
```

### Execute the sesion for login feature

```bash
rspec spec/controllers/sessions_controller_spec.rb
```
