# GitHub Actions for Codepush

This Action for [appcenter codepush](https://github.com/microsoft/appcenter-cli) enables arbitrary actions with the `appcenter` command-line client.

## Inputs

* `directory` - Directory from which to run the command
* `args` - **Required**. Arguments for the `appcenter codepush` command


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
This project was forked from https://github.com/FreeplayApp/codepush-action and updated to use a newer node version.

## License

The Dockerfile and associated scripts and documentation in this project are released under the [MIT License](LICENSE).
