### **Lab Manual: Symbolic Links, Hard Links, and Soft Links in Linux**

In this lab, we will explore the behavior of **hard links** and **soft (symbolic) links** in Linux through scenario-based experiments. This will help you understand how each type of link interacts with files and how they behave when the source file is deleted or recreated.

---

### **1. Scenario: Hard Link - What happens if the source file is deleted?**

#### **Step 1: Create a Hard Link**

First, create a file `source_file.txt` and a hard link to it called `hard_link.txt`.

```bash
echo "This is the source file." > source_file.txt
ln source_file.txt hard_link.txt
```

- `ln` is used to create a **hard link**.
- Now, both `source_file.txt` and `hard_link.txt` point to the same **data blocks** on the disk.

#### **Step 2: Delete the Source File**

Delete the original `source_file.txt`:

```bash
rm source_file.txt
```

#### **Observation:**

- The hard link `hard_link.txt` will **still retain the data** of the original file. This is because hard links reference the actual data (inode) on the disk, and as long as there is at least one link, the data remains intact.
  
#### **Conclusion:**

Even if the source file is deleted, the hard link retains access to the file’s data because both the source and the hard link reference the same inode. The file will not be removed from the system until **all hard links** to it are deleted.

---

### **2. Scenario: Soft Link - What happens if the source file is deleted?**

#### **Step 1: Create a Soft (Symbolic) Link**

Create a new file `source_file.txt` and a soft link to it called `soft_link.txt`.

```bash
echo "This is the source file." > source_file.txt
ln -s source_file.txt soft_link.txt
```

- `ln -s` creates a **soft (symbolic) link**, which points to the **file path** rather than the file’s data blocks.

#### **Step 2: Delete the Source File**

Delete the original `source_file.txt`:

```bash
rm source_file.txt
```

#### **Observation:**

- The **soft link** `soft_link.txt` is now **broken** because it points to a file that no longer exists. If you try to access it (e.g., `cat soft_link.txt`), you will receive an error like `No such file or directory`.
  
#### **Conclusion:**

When the source file of a symbolic link is deleted, the soft link becomes **broken** and cannot access the original data, as it points to a non-existent file path.

---

### **3. Scenario: Source File Deleted in Hard Link and Recreated with the Same Name**

#### **Step 1: Create a Hard Link**

Create a file `source_file.txt` and a hard link `hard_link.txt`:

```bash
echo "This is the source file." > source_file.txt
ln source_file.txt hard_link.txt
```

#### **Step 2: Delete the Source File**

Delete the original file `source_file.txt`:

```bash
rm source_file.txt
```

- As seen in the first scenario, the hard link `hard_link.txt` still retains access to the file’s data.

#### **Step 3: Recreate the Source File with the Same Name**

Now, recreate a new file with the same name, `source_file.txt`:

```bash
echo "This is a new source file." > source_file.txt
```

#### **Observation:**

- The newly created `source_file.txt` is **not connected** to `hard_link.txt`. The new `source_file.txt` has a **new inode** and is a completely different file, even though it has the same name as the original.
- The **hard link** `hard_link.txt` will still contain the original file's content ("This is the source file.") because it points to the original inode, not the newly created file.

#### **Conclusion:**

When a source file is deleted in a hard link and recreated with the same name, the hard link continues to point to the original data (inode), and the new source file is treated as a **separate entity** with a different inode.

---

### **Key Differences between Hard Links and Soft (Symbolic) Links**

| Feature                          | Hard Link                                 | Soft Link (Symbolic Link)          |
|-----------------------------------|-------------------------------------------|------------------------------------|
| **Points to**                     | The data blocks (inode) directly           | The file path                      |
| **Crosses filesystems**           | No                                        | Yes                                |
| **Effect when the source is deleted** | Data remains accessible via hard links    | Link is broken, and data is inaccessible |
| **Can point to directories?**     | No                                        | Yes (but not commonly used)        |
| **Storage**                       | Shares the same inode as the source file  | Has its own inode, but points to the source file |

---

### **Best Practices and Recommendations:**

- **Use Hard Links**: When you want multiple names for the same file, and you need to ensure the data stays intact even if one link is deleted.
- **Use Soft Links**: When you want to link to a file across different filesystems or directories, or when you want to link to a directory.
  
#### **Do:**
- Use hard links for files that you want to keep even if the original is deleted.
- Use soft links for referencing files that may move around or when you need to link to a directory.

#### **Don't:**
- Don’t create hard links for directories, as it’s not allowed and can create complex loops.
- Avoid creating soft links to non-existent files (broken links), as they will be unusable.

This lab demonstrates how to use symbolic and hard links and helps understand their behavior when the source files are manipulated.