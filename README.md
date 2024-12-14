![CleanShot 2024-12-15 at 00 36 05@2x](https://github.com/user-attachments/assets/a1eb0ecf-3f10-4219-863b-7f92cf573f70)

# WebScrapingDemo

This is a Ruby-based demo project designed to teach beginners how to perform both basic and interactive web scraping. This project leverages [Watir](https://watir.com/) for browser automation and [Nokogiri](https://nokogiri.org/) for HTML parsing. By following this tutorial, you'll learn how to navigate websites, handle login forms, and extract valuable data efficiently.

**Purpose**:  
This project serves as an educational tool to help you understand the fundamentals of web scraping using Ruby. It provides hands-on experience with automating interactions on a live website and extracting structured data from it.

## Table of Contents
- [WebScrapingDemo](#webscrapingdemo)
  - [Table of Contents](#table-of-contents)
  - [Demo Site Information](#demo-site-information)
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
  - [Configuring Headless Browser](#configuring-headless-browser)
    - [What is a Headless Browser?](#what-is-a-headless-browser)
    - [Enabling or Disabling Headless Mode](#enabling-or-disabling-headless-mode)
      - [How to Change Headless Configuration](#how-to-change-headless-configuration)
  - [Troubleshooting](#troubleshooting)
    - [Common Errors and Solutions](#common-errors-and-solutions)
  - [Contributing](#contributing)
  - [License](#license)

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

## Configuring Headless Browser

### What is a Headless Browser?

A **headless browser** is a web browser without a graphical user interface. It allows you to perform automated web interactions, such as navigating pages and filling out forms, without opening a visible browser window. This is particularly useful for running scripts on servers or environments where a display is not available.

### Enabling or Disabling Headless Mode

By default, the scraper scripts are set to run in headless mode to improve performance and reduce resource usage. If you prefer to see the browser actions in real-time for debugging or learning purposes, you can easily enable or disable headless mode by modifying a single line of code in each scraper file.

#### How to Change Headless Configuration

1. **Locate the Scraper File**:

   Navigate to the scraper file you want to configure. For example:
   - `scrapers/admin_page_scraper.rb`
   - `scrapers/homepage_scraper.rb`

2. **Modify the Browser Initialization Line**:

   Find the line where the Watir browser is initialized. It should look like this:

   ```ruby
   browser = Watir::Browser.new :chrome, headless: true
   ```

3. **Enable Headless Mode**:

   To **enable** headless mode (browser runs in the background without a UI), ensure the line is:
   ```ruby
   browser = Watir::Browser.new :chrome, headless: true
   ```

4. **Disable Headless Mode**:

   To **disable** headless mode (browser window will be visible), change the line to:
   ```ruby
   browser = Watir::Browser.new :chrome, headless: false
   ```
   
   Or simply remove the `headless` option, as `false` is the default value:
   
   ```ruby
   browser = Watir::Browser.new :chrome
   ```

**Note**: Disabling headless mode will open a new browser window each time you run the scraper, allowing you to observe the automated interactions.

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
