# GitHub Actions for Codepush

Make the `appcenter codepush` command ([appcenter codepush cli](https://github.com/microsoft/appcenter-cli)) available to any github action, so you can automatically release OTA-updates for your iOS/Android react-native apps.

## Inputs

* `args` - **Required**. Arguments for the `appcenter codepush` command
* `directory` - **Optional**. Directory from which to run the command. Use this if your code lives in a subdirectory of the repo.


## Environment variables

* `APPCENTER_ACCESS_TOKEN_X` - **Required**. The api token to use for authentication. This token can be generated through the `appcenter dashboard`.

## Example

Create a new release to Codepush Staging deployment on push to master branch:

```yaml
name: Codepush DEV
on:
  push:
    branches:
      - main

env:
  APP_CENTER_TOKEN_ANDROID: ${{ secrets.APPCENTER_API_TOKEN_ANDROID }}
  APP_NAME: ${{ 'org-name/app-name' }}
  APP_CENTER_TOKEN_IOS: ${{ secrets.APPCENTER_API_TOKEN_IOS }}
  APP_NAME_IOS: ${{ 'org-name/app-name-ios' }}

jobs:
  update-android:
    name: Codepush Anroid Update
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repository
        uses: actions/checkout@master

      - name: Install Dependencies
        run: npm install

      - name: Codepush Update
        uses: mvormisto/codepush-action@master
        with:
          args: release-react -a ${{ env.APP_NAME }} -d Development
        env:
          APPCENTER_ACCESS_TOKEN: ${{ env.APP_CENTER_TOKEN_ANDROID }}

  update-ios:
    name: Codepush iOS Update
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repository
        uses: actions/checkout@master

      - name: Install Dependencies
        run: npm install

      - name: Deploy to Codepush
        uses: mvormisto/codepush-action@master
        with:
          args: release-react -a ${{ env.APP_NAME_IOS }} -d Development
        env:
          APPCENTER_ACCESS_TOKEN: ${{ env.APP_CENTER_TOKEN_IOS }}

```

# Credit to Author
This Github Action was forked from https://github.com/TripleSpeeder/codepush-action and updated to not change the working directory when user gives no input.

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
