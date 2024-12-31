
# Multi-Search-Toolkit

## 📋 Overview
**Multi-Search-Toolkit** is a collection of batch scripts designed to automate various search tasks, including:
- URL searches
- Keyword-based Google searches
- VirusTotal lookups for domains, IPs, and hashes

This toolkit streamlines repetitive search tasks, allowing you to process multiple inputs efficiently.

---

## 🛠️ Features
- **URL Search**:
  - Open a list of URLs in your browser's incognito mode.
  - Automatically formats inputs to ensure compatibility (e.g., adds `https://` if missing).
  
- **Google Keyword Search**:
  - Perform Google searches for a list of keywords.
  - Opens search results in separate incognito tabs.

- **VirusTotal Search**:
  - Look up domains, IPs, and hashes on VirusTotal.
  - Automates opening VirusTotal's GUI with the provided inputs.

- **Batch Processing**:
  - Handles multiple entries from a single file.
  - Pauses after a set number of tabs to avoid browser overload.

---

## 🚀 How to Use
### 1. Clone the Repository
Download the toolkit to your local machine:
```bash
git clone https://github.com/smartboy223/Multi-Search-Toolkit.git
cd Multi-Search-Toolkit
```

### 2. Add Your Inputs
- Edit the `inputs.txt` file in the repository directory.
- Add one input per line:
  ```plaintext
  google.com
  stackoverflow.com
  example search keyword
  192.168.1.1
  ```

### 3. Run the Desired Script
- **URL Search**:
  ```bash
  url_search.bat
  ```
- **Google Keyword Search**:
  ```bash
  google_search_keyword.bat
  ```
- **VirusTotal Search**:
  ```bash
  virustotal_search.bat
  ```

---

## 📂 File Structure
- **`inputs.txt`**: Contains the list of inputs for the scripts.
- **`url_search.bat`**: Automates URL searches.
- **`google_search_keyword.bat`**: Automates Google keyword searches.
- **`virustotal_search.bat`**: Automates VirusTotal lookups.
- **`README.md`**: Documentation for the project.

---

## 📝 Notes
- Ensure `chrome.exe` or your preferred browser is in your system's PATH.
- Replace `chrome.exe` in the scripts with the executable of your preferred browser if necessary (e.g., `msedge.exe` for Microsoft Edge).
- Each script pauses after 10 tabs by default. You can adjust this limit by modifying the `if !num_tabs! geq 10` condition in the scripts.

---

## 🤝 Contributing
Contributions are welcome! Feel free to:
- Fork the repository
- Create a new branch:
  ```bash
  git checkout -b feature-name
  ```
- Commit your changes:
  ```bash
  git commit -m "Add your message here"
  ```
- Push to the branch:
  ```bash
  git push origin feature-name
  ```
- Open a pull request.

---

## 📧 Contact
Created by **smartboy223**. For inquiries, reach out via GitHub.

---

## 🏆 Acknowledgments
Thanks to the open-source community for tools and inspiration that make this project possible.
