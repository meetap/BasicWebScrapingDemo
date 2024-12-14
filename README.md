![CleanShot 2024-12-15 at 00 34 21@2x](https://github.com/user-attachments/assets/141eafd5-5b97-4e56-ae14-32a56da2801b)

# WebScrapingDemo

This is a Ruby-based demo project designed to teach beginners how to perform both basic and interactive web scraping. This project leverages [Watir](https://watir.com/) for browser automation and [Nokogiri](https://nokogiri.org/) for HTML parsing. By following this tutorial, you'll learn how to navigate websites, handle login forms, and extract valuable data efficiently.

**Purpose**:  
This project serves as an educational tool to help you understand the fundamentals of web scraping using Ruby. It provides hands-on experience with automating interactions on a live website and extracting structured data from it.

## Demo Site Information

For this demo, we will be using the [FireFrog Banking](https://demo.testfire.net/index.jsp) website, which is specifically designed for testing and educational purposes.

**Demo Website**:  
[https://demo.testfire.net/index.jsp](https://demo.testfire.net/index.jsp)

**Features of the Demo Site**:
- **Interactive Login Page**: Allows you to practice automating the login process.
- **Account Overview**: View account balances and recent transactions.
- **Demo Data**: The site contains predefined data suitable for scraping exercises.

**Demo Credentials**:
- **Username**: `admin`
- **Password**: `admin`

**Usage**:
1. **Navigate to the Login Page**:
   - URL: [https://demo.testfire.net/login.jsp](https://demo.testfire.net/login.jsp)
2. **Enter Credentials**:
   - Username: `admin`
   - Password: `admin`
3. **Access Account Information**:
   - After logging in, you can navigate to various sections to practice scraping different types of data such as account balances, recent transactions, credits, and debits.

**Security Notice**:
- The demo site is publicly accessible and intended solely for educational purposes. **Do not use real personal information or credentials** when interacting with this site.

## Table of Contents

- [WebScrapingDemo](#webscrapingdemo)
  - [Demo Site Information](#demo-site-information)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Prerequisites](#prerequisites)
    - [Installing Ruby](#installing-ruby)
      - [MacOS](#macos)
      - [Linux](#linux)
      - [Windows](#windows)
    - [Installing Git](#installing-git)
  - [Setting Up the Project](#setting-up-the-project)
    - [Cloning the Repository](#cloning-the-repository)
    - [Installing Dependencies](#installing-dependencies)
  - [Project Structure](#project-structure)
  - [Running the Scrapers Using the Ruby Command](#running-the-scrapers-using-the-ruby-command)
      - [Running the Admin Page Scraper](#running-the-admin-page-scraper)
      - [Running the Homepage Scraper](#running-the-homepage-scraper)
    - [Quick Reference Commands](#quick-reference-commands)
  - [Troubleshooting](#troubleshooting)
    - [Common Errors and Solutions](#common-errors-and-solutions)
  - [Contributing](#contributing)
  - [License](#license)

## Introduction

**MyScraper** is a Ruby-based tool that utilizes [Nokogiri](https://nokogiri.org/) for parsing HTML and [Watir](https://watir.com/) for automating web browsers. This tool is ideal for beginners who want to learn web scraping or professionals seeking a reliable solution for data extraction.

## Prerequisites

Before you begin, ensure you have the following installed on your machine:

1. **Ruby**: The programming language used for this project.
2. **Bundler**: A Ruby gem for managing project dependencies.
3. **Git**: For cloning the repository.

### Installing Ruby

#### MacOS

1. **Using Homebrew**:

   Homebrew is a popular package manager for MacOS. If you don't have Homebrew installed, you can install it by running the following command in your Terminal:

   ```bash
   /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
   ```

2. **Install Ruby**:

   Once Homebrew is installed, you can install Ruby by running:

   ```bash
   brew install ruby
   ```

3. **Update PATH**:

   After installation, ensure your system can locate the Ruby binaries. Add the following lines to your shell configuration file (e.g., `.bash_profile`, `.zshrc`):

   ```bash
   export PATH="/usr/local/opt/ruby/bin:$PATH"
   ```

   Then, apply the changes:

   ```bash
   source ~/.bash_profile
   # or
   source ~/.zshrc
   ```

4. **Verify Installation**:

   ```bash
   ruby -v
   ```

   You should see the Ruby version installed.

#### Linux

1. **Using Package Manager**:

   The installation command may vary based on your Linux distribution.

   - **Ubuntu/Debian**:

     ```bash
     sudo apt update
     sudo apt install ruby-full build-essential
     ```

   - **Fedora**:

     ```bash
     sudo dnf install ruby ruby-devel
     ```

   - **Arch Linux**:

     ```bash
     sudo pacman -S ruby
     ```

2. **Verify Installation**:

   ```bash
   ruby -v
   ```

   You should see the Ruby version installed.

#### Windows

1. **Using RubyInstaller**:

   - Go to the [RubyInstaller](https://rubyinstaller.org/) website.
   - Download the latest Ruby+Devkit installer (e.g., Ruby 3.x.x).
   - Run the installer and follow the on-screen instructions.
   - Ensure you select the option to add Ruby executables to your PATH.
   - After installation, open the Command Prompt and verify:

     ```cmd
     ruby -v
     ```

     You should see the Ruby version installed.

2. **Installing MSYS2 (if prompted)**:

   During the Ruby installation on Windows, you might be prompted to install MSYS2. Follow the prompts to complete the installation, which is necessary for building native Ruby gems.

### Installing Git

Git is essential for cloning the repository. If you don't have Git installed, follow the instructions for your operating system.

- **MacOS**: Install via Homebrew

  ```bash
  brew install git
  ```

- **Linux**: Install via Package Manager

  ```bash
  # Ubuntu/Debian
  sudo apt install git

  # Fedora
  sudo dnf install git

  # Arch Linux
  sudo pacman -S git
  ```

- **Windows**: Download and install from the [official website](https://git-scm.com/download/win).

## Setting Up the Project

### Cloning the Repository

First, clone the WebScrapingDemo repository to your local machine.

```bash
git clonehttps://github.com/MeetAp/BasicWebScrapingDemo.git
cd BasicWebScrapingDemo
```

### Installing Dependencies

1. **Install Bundler**:

   Bundler manages the project's Ruby gem dependencies. Install it by running:

   ```bash
   gem install bundler
   ```

2. **Install Project Gems**:

   Navigate to the project directory and install the required gems using Bundler.

   ```bash
   bundle install
   ```

   This command reads the `Gemfile` and installs all the listed gems, such as Nokogiri and Watir.

## Project Structure

Here's an overview of the project's directory structure:

```plaintext
├── Gemfile
├── Gemfile.lock
├── README.md
└── scrapers
    ├── admin_page_scraper.rb
    └── homepage_scraper.rb
```

- **Gemfile & Gemfile.lock**: Manage and lock gem dependencies.
- **README.md**: Project documentation.
- **scrapers/**: Holds the Ruby codebase.
  - `admin_page_scraper.rb`: Scraper for the admin page.
  - `homepage_scraper.rb`: Scraper for the homepage.

## Running the Scrapers Using the Ruby Command

You can run the scraper scripts directly using the `ruby` command. This method is straightforward and works across all operating systems.

#### Running the Admin Page Scraper

```bash
ruby scrapers/admin_page_scraper.rb
```

#### Running the Homepage Scraper

```bash
ruby scrapers/homepage_scraper.rb
```

**Explanation**:

- `ruby`: The Ruby interpreter.
- `lib/scrapers/admin_page_scraper.rb`: Path to the Admin Page Scraper script.
  
When you run this command, Ruby executes the specified script, and the scraper performs its designated tasks, such as extracting data and displaying it in the console.

**Common Issues**:
- **Script/File Not Found**: Ensure you're in the project root directory when running these commands.

### Quick Reference Commands

- **Run Admin Scraper via Ruby**:

  ```bash
  ruby lib/scrapers/admin_page_scraper.rb
  ```

- **Run Homepage Scraper via Ruby**:

  ```bash
  ruby lib/scrapers/homepage_scraper.rb
  ```

## Troubleshooting

### Common Errors and Solutions

1. **Ruby Not Found**

   **Cause**: Ruby is not installed or not added to the system PATH.

   **Solution**:

   - Follow the [Installing Ruby](#installing-ruby) section to install Ruby.
   - Ensure Ruby's bin directory is in your system's PATH.

2. **Missing Gems**

   **Cause**: Required gems are not installed.

   **Solution**:

   - Run:

     ```bash
     bundle install
     ```

3. **Script Exceptions**

   **Cause**: Errors within the scraper scripts (e.g., network issues, changes in webpage structure).

   **Solution**:

   - Review error messages in the console.
   - Ensure the target webpage's structure hasn't changed.
   - Implement logging for better error tracking (optional).

## Contributing

Contributions are welcome! If you'd like to contribute:

1. **Fork the Repository**: Click the "Fork" button at the top right of the repository page.

2. **Create a Feature Branch**:

   ```bash
   git checkout -b feature/YourFeatureName
   ```

3. **Commit Your Changes**:

   ```bash
   git commit -m "Add your message here"
   ```

4. **Push to the Branch**:

   ```bash
   git push origin feature/YourFeatureName
   ```

5. **Open a Pull Request**: Go to the original repository and create a pull request with your changes.

## License

This project is licensed under the [MIT License](LICENSE).

---

**Happy Scraping!**
