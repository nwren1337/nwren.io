![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/nwren1337/nwren.io/main.yml?style=plastic)
![Website](https://img.shields.io/website?url=https%3A%2F%2Fnwren.io&style=plastic)

# nwren.io

Static website for digital business card. See the it live at [nwren.io](https://nwren.io)!

## development env

One may not think that a static website does not require a development environment, but then one must never have opened an HTML document over the WSL2 file share.

Docker compose file sets up a basic nginx docker image which serves the site from the static folder. Config has additional headers to prevent CORs blocking. This is not intended to be ran in production anywhere.