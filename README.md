# Vodafone Automation Project

## Overview

This project uses Robot Framework for automated UI testing of Vodafone's web application. It integrates SeleniumLibrary for browser automation and includes custom Python helpers.

## Prerequisites

- Python 3.12 or higher
- Google Chrome browser
- ChromeDriver (automatically managed)
- Recommended: Use a virtual environment

## Installation

1. **Clone the repository**
   ```sh
   git clone <repository-url>
   cd vodaphone.automation
   ```

2. **Install dependencies**
   ```sh
   pip install -r requirements.txt
   ```

## Running Tests

You can run the tests using Robot Framework. By default, tests run in headless Chrome and store logs in `logs/chrome`.

```sh
robot -d logs/chrome -i test tests
```

- `-d logs/chrome`: Output directory for logs and reports
- `-v BROWSER:chrome`: Add this tag if you don't want to run the test in headless

## Viewing Results

After running tests, open the following files for results:

- **Log:** [logs/chrome/log.html](logs/chrome/log.html)
- **Report:** [logs/chrome/report.html](logs/chrome/report.html)
- **Screenshots:** [logs/chrome/screenshots/](logs/chrome/screenshots/)

## Continuous Integration

Tests are automatically run on GitHub Actions using [`.github/workflows/run-ci-test.yaml`](.github/workflows/run-ci-test.yaml).

## Project Structure

- `source/` - Robot Framework resource and test files
- `helpers/` - Python helper scripts
- `data/` - Test data, variables, and locators
- `tests/` - Main test suites

## Custom Helpers

Python helpers (e.g., [`helpers/get_cta_label.py`](helpers/get_cta_label.py)) are imported in Robot Framework using the `Library` setting.

## Variables and Locators

- Variables: [`data/variables/public_variables.robot`](data/variables/public_variables.robot)
- Locators: [`data/locators/locators.yaml`](data/locators/locators.yaml)

## Troubleshooting

- Ensure Chrome and ChromeDriver are installed and compatible.
- If you encounter issues, check the log files in `logs/chrome`.