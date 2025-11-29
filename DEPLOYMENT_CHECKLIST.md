# Deployment Setup Checklist

Follow these steps to complete your automated deployment setup:

## ✅ Pre-deployment Checklist

- [ ] Repository is pushed to GitHub (https://github.com/shortcutForAll/fastshortcuts)
- [ ] You have access to your Hostinger hosting panel
- [ ] You have obtained FTP credentials from Hostinger

## 📋 GitHub Secrets Configuration

Go to: https://github.com/shortcutForAll/fastshortcuts/settings/secrets/actions

Add these three secrets:

- [ ] **FTP_SERVER** - Your Hostinger FTP server hostname
  - Example: `ftp.yourdomain.com` or IP like `123.456.789.012`
  - Find it in: Hostinger Panel → Files → FTP Accounts

- [ ] **FTP_USERNAME** - Your FTP username
  - Find it in: Hostinger Panel → Files → FTP Accounts

- [ ] **FTP_PASSWORD** - Your FTP password
  - Find it in: Hostinger Panel → Files → FTP Accounts

## 🔧 Workflow Configuration

- [ ] Review `.github/workflows/deploy.yml`
- [ ] Confirm the branch name is correct (default: `main`)
- [ ] Confirm the remote directory is correct (default: `./public_html/`)
- [ ] Adjust exclude patterns if needed

## 🚀 First Deployment

Run these commands:

```bash
cd /Users/sauravvyas/Desktop/fastshortcuts
git add .
git commit -m "Initial commit with automated deployment"
git push origin main
```

- [ ] Pushed code to GitHub
- [ ] Checked Actions tab for deployment status
- [ ] Verified files appeared on Hostinger

## 🧪 Testing

- [ ] Visit your website to confirm deployment worked
- [ ] Make a small change (e.g., edit index.html)
- [ ] Push the change
- [ ] Verify automatic deployment triggered
- [ ] Confirm change is live on your website

## 📝 Optional Enhancements

- [ ] Set up build process (if using React, Vue, etc.)
- [ ] Configure environment variables
- [ ] Set up custom domain
- [ ] Add SSL certificate (Hostinger usually provides free SSL)
- [ ] Configure deployment notifications (Slack, Discord, Email)

## 🔐 Security Best Practices

- [ ] Never commit FTP credentials to the repository
- [ ] Keep GitHub secrets secure
- [ ] Ensure .gitignore includes sensitive files
- [ ] Consider using SSH instead of FTP (if Hostinger supports it)

## 📞 Support

If you encounter issues:
1. Check GitHub Actions logs
2. Verify FTP credentials in Hostinger panel
3. Test FTP connection manually using FileZilla or similar
4. Check Hostinger firewall/security settings

---

**Status:** ⏳ Pending Setup

Once completed, change status to: ✅ Fully Configured
