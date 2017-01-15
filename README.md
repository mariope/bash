# bash scripts v0.1.0.9000

This is a repository for my own bash scripts.

## Getting Started
Review the [NEWS.md](NEWS.md) file to view the changes log.

### cam.sh
Scrap the CAM web page, get news and send it by Sendgrid mail.
```(bash)
> ./cam.sh
```
This script use:
- curl, to manage http connection
- xmllint, to scrap content
- sed, to filter string stream removing and inserting text (unused)
- Sendgrid, to send mail with formatted text

## Contributing

Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

I use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/mariope/bash/tags).

## Authors

* **Mario Pisa** - *Initial work* - [bash scripts](https://github.com/mariope/bash)

## License

This project is licensed under the GPL-3 License - see the [LICENSE](LICENSE) file for details

## Acknowledgments

* To Open Source community.
