# FastShortcuts - Automated Deployment Setup

This repository is configured for automatic deployment to Hostinger hosting via GitHub Actions.

## 🚀 How It Works

Every time you push to the `main` branch, GitHub Actions will automatically:
1. Check out your code
2. Build your application (if configured)
3. Deploy to your Hostinger hosting via FTP

## ⚙️ Setup Instructions

### Step 1: Get Your Hostinger FTP Credentials

1. Log in to your Hostinger control panel (hPanel)
2. Go to **Files** → **FTP Accounts**
3. Note down or create FTP credentials:
   - FTP Server (hostname)
   - FTP Username
   - FTP Password
   - Remote directory (usually `public_html`)

### Step 2: Add Secrets to GitHub Repository

1. Go to your GitHub repository: https://github.com/shortcutForAll/fastshortcuts
2. Click on **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret** and add the following secrets:

   **Secret Name:** `FTP_SERVER`
   **Value:** Your Hostinger FTP server (e.g., `ftp.yourdomain.com` or `123.456.789.012`)

   **Secret Name:** `FTP_USERNAME`
   **Value:** Your FTP username

   **Secret Name:** `FTP_PASSWORD`
   **Value:** Your FTP password

### Step 3: Configure Deployment Settings (Optional)

Edit `.github/workflows/deploy.yml` to customize:
- **Branch name**: Change `main` to your default branch if different
- **Server directory**: Change `./public_html/` to your target directory
- **Local directory**: Change `./` to `./dist/` or `./build/` if you have a build step
- **Exclude patterns**: Add more files/folders to exclude from deployment

### Step 4: Deploy

Simply push your changes to the main branch:

```bash
git add .
git commit -m "Your commit message"
git push origin main
```

The deployment will start automatically! 🎉

## 📊 Monitoring Deployments

1. Go to your GitHub repository
2. Click on the **Actions** tab
3. You'll see all deployment runs and their status
4. Click on any run to see detailed logs

## 🔧 Troubleshooting

### Deployment fails with authentication error
- Double-check your FTP credentials in GitHub Secrets
- Ensure your Hostinger FTP account is active

### Files not appearing on server
- Check the `server-dir` path in the workflow file
- Verify the remote directory exists on your Hostinger account
- Check the deployment logs in GitHub Actions for errors

### Need to deploy a specific folder only
Edit `.github/workflows/deploy.yml` and change:
```yaml
local-dir: ./dist/  # or ./build/, etc.
```

## 🔐 Security Notes

- Never commit FTP credentials directly to the repository
- Always use GitHub Secrets for sensitive information
- The `.env` file is automatically excluded from deployment

## 📝 Alternative: Using SFTP

If your Hostinger plan supports SFTP (more secure), you can use a different action.
Edit `.github/workflows/deploy.yml` and replace the FTP deploy step with an SFTP solution.

## 🆘 Need Help?

- Check GitHub Actions logs for detailed error messages
- Verify your Hostinger FTP settings
- Ensure your Hostinger account has sufficient permissions

---

**Happy Coding! 🚀**
