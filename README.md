# GitHub Actions for Codepush

Make the `appcenter codepush` command ([appcenter codepush cli](https://github.com/microsoft/appcenter-cli)) available to any github action, so you can automatically release OTA-updates for your iOS/Android react-native apps.

## Inputs

* `args` - **Required**. Arguments for the `appcenter codepush` command
* `directory` - **Optional**. Directory from which to run the command. Use this if your code lives in a subdirectory of the repo.


## Environment variables

* `APPCENTER_ACCESS_TOKEN` - **Required**. The token to use for authentication. This token can be aquired through the `appcenter dashboard`.

## Example

Create a new release to Codepush Staging deployment on push to master branch:

```yaml
name: Build and Deploy
on:
  push:
    branches:
      - master

jobs:
  deploy:
    name: Deploy
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repo
        uses: actions/checkout@master
      - name: Install Dependencies
        run: npm install
      - name: Deploy to Codepush
        uses: TripleSpeeder/codepush-action@master
        with:
          args: release-react -d Staging
        env:
          APPCENTER_ACCESS_TOKEN: ${{ secrets.APPCENTER_ACCESS_TOKEN }}
```

# Credit to Author
This Github Action was forked from https://github.com/FreeplayApp/codepush-action and updated to use a newer node version.

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
