# meteor-boilerplate-script

This is my attempt in writing a quick script to get my meteor projects setup quickly.

## Packages

Currently, the script will automatically install the following packages:

- `underscore`
- `ewall:foundation`
- `stylus`
- `iron:router`

You can simply edit `setup.sh` to add the packages you like. However, since I prefer working with Foundation and Stylus, this boilerplate project requires them to look right.

## Installation

Just run the `setup.sh` script with your project name as an argument, here's an example:

```
bash meteor-boilerplate-script/setup.sh myApp
```

When the script is finished, your meteor project is ready to run!
