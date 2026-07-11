#!/usr/bin/env python3
"""Upgrade legacy shortcut pages to 2026 SEO template."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parent.parent
DATE = "2026-07-11"

PAGES = {
    "zoom": {
        "title": "Zoom Keyboard Shortcuts 2026 | Complete Cheat Sheet for Windows & Mac",
        "og_title": "Zoom Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "Zoom Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "Zoom Keyboard Shortcuts",
        "about_name": "Zoom",
        "about_category": "BusinessApplication",
        "about_os": "Windows, macOS",
        "about_url": "https://zoom.us",
        "intro": "Master <strong>Zoom</strong> meetings without touching the mouse. Mute with <kbd>Alt+A</kbd> / <kbd>⌘⇧A</kbd>, share your screen with <kbd>Alt+S</kbd>, and open chat with <kbd>Alt+H</kbd>. Every shortcut below is cross-checked against <a href=\"https://support.zoom.us/hc/en-us/articles/205683899-Hot-Keys-and-Keyboard-Shortcuts-for-Zoom\" target=\"_blank\" rel=\"noopener\">Zoom's official hotkey documentation</a>.",
        "seo_h2": "Why Zoom Keyboard Shortcuts Matter (2026)",
        "seo_p": "In back-to-back video calls, fumbling for mute or share controls breaks your flow. Zoom global shortcuts work even when the app is in the background—enable them under Settings → Keyboard Shortcuts. Start with mute, video, screen share, and raise hand; add recording and view toggles once those are muscle memory. Pair with our <a href=\"../slack/\">Slack</a>, <a href=\"../microsoft-teams/\">Microsoft Teams</a>, and <a href=\"../outlook/\">Outlook</a> guides for full remote-work coverage.",
        "faqs": [
            ("How do I enable Zoom keyboard shortcuts?", "Open Zoom Settings → Keyboard Shortcuts and enable global shortcuts. On Windows, Alt-based shortcuts work during meetings. On Mac, use Cmd+Shift combinations for most meeting controls."),
            ("What is the shortcut to mute in Zoom?", "Press Alt+A on Windows or Cmd+Shift+A on Mac to mute or unmute your microphone during a meeting."),
            ("How do I share my screen in Zoom with a keyboard shortcut?", "Press Alt+S on Windows or Cmd+Shift+S on Mac to start or stop screen sharing during an active meeting."),
            ("Are Zoom shortcuts the same on Mac and Windows?", "No. Windows uses Alt-based shortcuts (Alt+A, Alt+V, Alt+S). Mac uses Cmd+Shift combinations (⌘⇧A, ⌘⇧V, ⌘⇧S). Always check the platform tab for your OS."),
            ("How do I see all Zoom keyboard shortcuts?", "During a meeting, press Ctrl+/ on Windows or Cmd+/ on Mac to open Zoom's built-in keyboard shortcuts panel."),
        ],
        "related": "Slack • Microsoft Teams • Outlook • Gmail",
        "related_links": [("../slack/", "Slack"), ("../microsoft-teams/", "Microsoft Teams"), ("../outlook/", "Outlook"), ("../gmail/", "Gmail")],
        "official": "https://support.zoom.us/hc/en-us/articles/205683899-Hot-Keys-and-Keyboard-Shortcuts-for-Zoom",
        "needs_head_schema": True,
    },
    "windows": {
        "title": "Windows Keyboard Shortcuts 2026 | Complete Cheat Sheet for Windows 11 & 10",
        "og_title": "Windows Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "Windows Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "Windows Keyboard Shortcuts",
        "about_name": "Windows",
        "about_category": "OperatingSystem",
        "about_os": "Windows 10, Windows 11",
        "about_url": "https://www.microsoft.com/windows",
        "intro": "Every essential <strong>Windows</strong> keyboard shortcut in one searchable cheat sheet—from Win+E and Snap Assist to virtual desktops, File Explorer, and PowerShell. Sourced from <a href=\"https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-windows-d463204e-9988-4b68-0ac9-1b0a5a8b5270\" target=\"_blank\" rel=\"noopener\">Microsoft's official Windows shortcut documentation</a>.",
        "seo_h2": "Why Windows Shortcuts Matter (2026)",
        "seo_p": "The Windows key unlocks hundreds of actions: Win+←/→ snaps windows, Win+Ctrl+D creates virtual desktops, Win+V opens clipboard history. Learning 20 shortcuts replaces minutes of mouse navigation daily. Also see our <a href=\"../chrome/\">Chrome</a>, <a href=\"../excel/\">Excel</a>, and <a href=\"../vscode/\">VS Code</a> guides.",
        "faqs": [
            ("What are the most useful Windows keyboard shortcuts?", "Win+E (File Explorer), Win+D (show desktop), Win+L (lock PC), Alt+Tab (switch apps), Win+←/→ (snap windows), Ctrl+Shift+Esc (Task Manager), and Win+V (clipboard history) are the essentials every Windows user should know."),
            ("How do I snap windows on Windows 11?", "Press Win+Left Arrow or Win+Right Arrow to snap the active window to half the screen. Win+Up maximizes; Win+Down restores or minimizes."),
            ("How do I switch between virtual desktops?", "Press Win+Ctrl+Left Arrow or Win+Ctrl+Right Arrow to move between desktops. Win+Ctrl+D creates a new desktop; Win+Ctrl+F4 closes the current one."),
            ("Are Windows 10 and Windows 11 shortcuts the same?", "Most core shortcuts are identical. Windows 11 adds Snap Layouts (Win+Z) and an updated Quick Settings panel (Win+A). This guide covers both versions."),
        ],
        "related": "Chrome • Excel • VS Code • macOS",
        "related_links": [("../chrome/", "Chrome"), ("../excel/", "Excel"), ("../vscode/", "VS Code"), ("../mac/", "macOS")],
        "official": "https://support.microsoft.com/en-us/windows/keyboard-shortcuts-in-windows-d463204e-9988-4b68-0ac9-1b0a5b5270",
    },
    "mac": {
        "title": "macOS Keyboard Shortcuts 2026 | Complete Cheat Sheet for Mac",
        "og_title": "macOS Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "macOS Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "macOS Keyboard Shortcuts",
        "about_name": "macOS",
        "about_category": "OperatingSystem",
        "about_os": "macOS",
        "about_url": "https://www.apple.com/macos",
        "intro": "Master <strong>macOS</strong> with every essential keyboard shortcut—Spotlight, Mission Control, Finder, text editing, and system controls. Cross-referenced with <a href=\"https://support.apple.com/en-us/102650\" target=\"_blank\" rel=\"noopener\">Apple's official Mac shortcut documentation</a>.",
        "seo_h2": "Why macOS Shortcuts Matter (2026)",
        "seo_p": "Cmd+Space opens Spotlight, Cmd+Tab switches apps, and Ctrl+Cmd+Space inserts emoji. Mac power users rarely touch the dock. Start with Finder navigation (Cmd+Shift+G, Cmd+Delete) and window management (Cmd+M, Cmd+H). Compare with our <a href=\"../windows/\">Windows</a> and <a href=\"../raycast/\">Raycast</a> guides.",
        "faqs": [
            ("What are the most important Mac keyboard shortcuts?", "Cmd+C/V/Z (copy/paste/undo), Cmd+Space (Spotlight), Cmd+Tab (switch apps), Cmd+Q (quit app), Cmd+W (close window), and Cmd+Shift+3/4 (screenshots) cover daily Mac use."),
            ("How do I open Spotlight on Mac?", "Press Cmd+Space to open Spotlight search. Type an app name and press Return to launch it instantly."),
            ("How do I take a screenshot on Mac?", "Cmd+Shift+3 captures the full screen. Cmd+Shift+4 lets you select an area. Cmd+Shift+5 opens the screenshot toolbar with recording options."),
            ("What is the Mac equivalent of Ctrl on Windows?", "The Cmd (⌘) key replaces Ctrl for most shortcuts. Option (⌥) maps to Alt, and Control (⌃) is used for additional bindings in terminals and some apps."),
        ],
        "related": "Windows • Raycast • VS Code • Chrome",
        "related_links": [("../windows/", "Windows"), ("../raycast/", "Raycast"), ("../vscode/", "VS Code"), ("../chrome/", "Chrome")],
        "official": "https://support.apple.com/en-us/102650",
    },
    "chrome": {
        "title": "Chrome Keyboard Shortcuts 2026 | Complete Cheat Sheet for Windows & Mac",
        "og_title": "Chrome Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "Chrome Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "Chrome Keyboard Shortcuts",
        "about_name": "Google Chrome",
        "about_category": "BrowserApplication",
        "about_os": "Windows, macOS, Linux",
        "about_url": "https://www.google.com/chrome",
        "intro": "Browse faster with every <strong>Google Chrome</strong> keyboard shortcut—tabs, bookmarks, DevTools, history, and find-in-page. Based on <a href=\"https://support.google.com/chrome/answer/157179\" target=\"_blank\" rel=\"noopener\">Google's official Chrome shortcut list</a>.",
        "seo_h2": "Why Chrome Shortcuts Matter (2026)",
        "seo_p": "Ctrl/Cmd+T opens a tab, Ctrl/Cmd+Shift+T reopens the last closed tab, and Ctrl/Cmd+L focuses the address bar. DevTools (F12 or Cmd+Opt+I) and tab cycling (Ctrl/Cmd+Tab) save hours for developers. See also <a href=\"../vscode/\">VS Code</a> and <a href=\"../windows/\">Windows</a> shortcuts.",
        "faqs": [
            ("What are the best Chrome keyboard shortcuts?", "Ctrl/Cmd+T (new tab), Ctrl/Cmd+W (close tab), Ctrl/Cmd+Shift+T (reopen tab), Ctrl/Cmd+L (address bar), Ctrl/Cmd+F (find), and Ctrl/Cmd+Shift+Delete (clear browsing data) are the essentials."),
            ("How do I reopen a closed tab in Chrome?", "Press Ctrl+Shift+T on Windows or Cmd+Shift+T on Mac to reopen the most recently closed tab."),
            ("How do I open Chrome DevTools with a keyboard shortcut?", "Press F12 or Ctrl+Shift+I on Windows. On Mac, use Cmd+Option+I."),
            ("Are Chrome shortcuts the same on Mac and Windows?", "Most shortcuts use Cmd on Mac where Windows uses Ctrl. Chrome's official list documents both platforms side by side."),
        ],
        "related": "VS Code • Windows • macOS • Gmail",
        "related_links": [("../vscode/", "VS Code"), ("../windows/", "Windows"), ("../mac/", "macOS"), ("../gmail/", "Gmail")],
        "official": "https://support.google.com/chrome/answer/157179",
    },
    "sublime": {
        "title": "Sublime Text Keyboard Shortcuts 2026 | Complete Cheat Sheet",
        "og_title": "Sublime Text Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "Sublime Text Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "Sublime Text Keyboard Shortcuts",
        "about_name": "Sublime Text",
        "about_category": "DeveloperApplication",
        "about_os": "Windows, macOS, Linux",
        "about_url": "https://www.sublimetext.com",
        "intro": "Every essential <strong>Sublime Text</strong> shortcut—multi-cursor editing, Goto Anything, command palette, and code folding. Reference: <a href=\"https://www.sublimetext.com/docs/key-bindings.html\" target=\"_blank\" rel=\"noopener\">Sublime Text official key bindings</a>.",
        "seo_h2": "Why Sublime Text Shortcuts Matter (2026)",
        "seo_p": "Sublime's killer feature is multi-cursor editing: Ctrl/Cmd+D selects the next match, Ctrl/Cmd+Shift+L selects all matches. Cmd/Ctrl+P opens Goto Anything; Cmd/Ctrl+Shift+P opens the command palette. Still a favorite for speed-focused developers alongside <a href=\"../vscode/\">VS Code</a> and <a href=\"../zed/\">Zed</a>.",
        "faqs": [
            ("What is the most important Sublime Text shortcut?", "Cmd/Ctrl+P (Goto Anything) is the single most powerful shortcut—it jumps to files, symbols, and line numbers instantly."),
            ("How do I use multiple cursors in Sublime Text?", "Press Cmd/Ctrl+D to select the next occurrence of the current word. Cmd/Ctrl+Shift+L selects all occurrences at once. Hold Alt and click to add cursors manually."),
            ("How do I open the command palette in Sublime Text?", "Press Cmd+Shift+P on Mac or Ctrl+Shift+P on Windows/Linux to open the command palette and run any Sublime command by name."),
            ("Can I customize Sublime Text key bindings?", "Yes. Edit Preferences → Key Bindings to add custom shortcuts in JSON. Sublime uses a flexible keymap system similar to VS Code."),
        ],
        "related": "VS Code • Zed • IntelliJ • Cursor",
        "related_links": [("../vscode/", "VS Code"), ("../zed/", "Zed"), ("../intellij/", "IntelliJ"), ("../cursor/", "Cursor")],
        "official": "https://www.sublimetext.com/docs/key-bindings.html",
    },
    "intellij": {
        "title": "IntelliJ IDEA Keyboard Shortcuts 2026 | Complete Cheat Sheet",
        "og_title": "IntelliJ IDEA Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "IntelliJ IDEA Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "IntelliJ IDEA Keyboard Shortcuts",
        "about_name": "IntelliJ IDEA",
        "about_category": "DeveloperApplication",
        "about_os": "Windows, macOS, Linux",
        "about_url": "https://www.jetbrains.com/idea",
        "intro": "Master <strong>IntelliJ IDEA</strong> with every essential shortcut—refactoring, navigation, debugging, and the double-Shift search. From <a href=\"https://resources.jetbrains.com/storage/products/intellij-idea/docs/IntelliJIDEA_ReferenceCard.pdf\" target=\"_blank\" rel=\"noopener\">JetBrains official reference</a>.",
        "seo_h2": "Why IntelliJ Shortcuts Matter (2026)",
        "seo_p": "IntelliJ is built around the keyboard: Shift+Shift searches everywhere, Alt+Enter shows intentions, and Ctrl/Cmd+B goes to declaration. Refactoring shortcuts (Shift+F6 rename, Ctrl/Cmd+Alt+L format) are industry standard. Compare with <a href=\"../vscode/\">VS Code</a> and <a href=\"../cursor/\">Cursor</a>.",
        "faqs": [
            ("What is the most important IntelliJ shortcut?", "Double-tap Shift to open Search Everywhere—it finds files, classes, symbols, actions, and settings from one place."),
            ("How do I refactor in IntelliJ with keyboard shortcuts?", "Shift+F6 renames, Ctrl/Cmd+Alt+M extracts method, Ctrl/Cmd+Alt+V extracts variable, and Alt+Enter shows context-aware quick fixes."),
            ("How do I navigate code in IntelliJ?", "Ctrl/Cmd+B goes to declaration, Ctrl/Cmd+Alt+B goes to implementation, Alt+F7 finds usages, and Ctrl/Cmd+E shows recent files."),
            ("Are IntelliJ shortcuts the same on Mac and Windows?", "Most shortcuts map Ctrl on Windows/Linux to Cmd on Mac. JetBrains documents both keymaps in Settings → Keymap."),
        ],
        "related": "VS Code • Cursor • GitHub Copilot • Sublime Text",
        "related_links": [("../vscode/", "VS Code"), ("../cursor/", "Cursor"), ("../github-copilot/", "GitHub Copilot"), ("../sublime/", "Sublime Text")],
        "official": "https://resources.jetbrains.com/storage/products/intellij-idea/docs/IntelliJIDEA_ReferenceCard.pdf",
    },
    "photoshop": {
        "title": "Photoshop Keyboard Shortcuts 2026 | Complete Cheat Sheet for Windows & Mac",
        "og_title": "Photoshop Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "Photoshop Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "Photoshop Keyboard Shortcuts",
        "about_name": "Adobe Photoshop",
        "about_category": "DesignApplication",
        "about_os": "Windows, macOS",
        "about_url": "https://www.adobe.com/products/photoshop.html",
        "intro": "Every essential <strong>Adobe Photoshop</strong> shortcut—layers, brushes, selection tools, transforms, and adjustment layers. Reference: <a href=\"https://helpx.adobe.com/photoshop/using/default-keyboard-shortcuts.html\" target=\"_blank\" rel=\"noopener\">Adobe's official Photoshop shortcut list</a>.",
        "seo_h2": "Why Photoshop Shortcuts Matter (2026)",
        "seo_p": "Press B for brush, V for move, M for marquee, and Ctrl/Cmd+T for free transform. Layer shortcuts (Ctrl/Cmd+J duplicate, Ctrl/Cmd+G group) speed up every edit session. Designers who memorize 30 shortcuts cut editing time dramatically. Also see <a href=\"../figma/\">Figma</a> shortcuts.",
        "faqs": [
            ("What are the essential Photoshop keyboard shortcuts?", "V (move), B (brush), E (eraser), M (marquee), L (lasso), Ctrl/Cmd+T (transform), Ctrl/Cmd+J (duplicate layer), and Ctrl/Cmd+Shift+N (new layer) cover most editing workflows."),
            ("How do I undo in Photoshop?", "Press Ctrl+Z on Windows or Cmd+Z on Mac. Ctrl/Cmd+Alt+Z (Win) or Cmd+Option+Z (Mac) steps backward through history."),
            ("How do I zoom in Photoshop with keyboard shortcuts?", "Ctrl/Cmd++ zooms in, Ctrl/Cmd+- zooms out, and Ctrl/Cmd+0 fits to screen. Hold Space and drag to pan."),
            ("Are Photoshop shortcuts the same on Mac and Windows?", "Most tool shortcuts (single letters) are identical. Ctrl on Windows maps to Cmd on Mac for commands like save, undo, and transform."),
        ],
        "related": "Figma • OBS Studio • Chrome • Windows",
        "related_links": [("../figma/", "Figma"), ("../obs-studio/", "OBS Studio"), ("../chrome/", "Chrome"), ("../windows/", "Windows")],
        "official": "https://helpx.adobe.com/photoshop/using/default-keyboard-shortcuts.html",
    },
    "figma": {
        "title": "Figma Keyboard Shortcuts 2026 | Complete Cheat Sheet for Windows & Mac",
        "og_title": "Figma Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "Figma Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "Figma Keyboard Shortcuts",
        "about_name": "Figma",
        "about_category": "DesignApplication",
        "about_os": "Windows, macOS, Web",
        "about_url": "https://www.figma.com",
        "intro": "Design faster with every <strong>Figma</strong> keyboard shortcut—frames, components, auto layout, prototyping, and Dev Mode. From <a href=\"https://help.figma.com/hc/en-us/articles/360040328753-Keyboard-shortcuts-in-Figma\" target=\"_blank\" rel=\"noopener\">Figma's official shortcut documentation</a>.",
        "seo_h2": "Why Figma Shortcuts Matter (2026)",
        "seo_p": "Figma is keyboard-first: F for frame, R for rectangle, K for scale, and Ctrl/Cmd+D duplicates. Ctrl/Cmd+G groups; Shift+A adds auto layout. Press ? inside Figma to see the full cheat sheet overlay. Pair with our <a href=\"../photoshop/\">Photoshop</a> and <a href=\"../notion/\">Notion</a> guides.",
        "faqs": [
            ("What are the most useful Figma keyboard shortcuts?", "V (move), F (frame), R (rectangle), T (text), K (scale), Ctrl/Cmd+D (duplicate), Ctrl/Cmd+G (group), and Shift+A (auto layout) are the daily essentials."),
            ("How do I see all Figma keyboard shortcuts?", "Press ? (question mark) while focused in Figma to open the interactive keyboard shortcuts overlay."),
            ("How do I create a component in Figma with a shortcut?", "Select a frame or object and press Ctrl/Cmd+Alt+K to create a component, or Ctrl/Cmd+Alt+B to detach an instance."),
            ("Are Figma shortcuts the same on Mac and Windows?", "Yes for single-key tool shortcuts. Ctrl on Windows maps to Cmd on Mac for commands like duplicate, group, and undo."),
        ],
        "related": "Photoshop • Notion • Slack • VS Code",
        "related_links": [("../photoshop/", "Photoshop"), ("../notion/", "Notion"), ("../slack/", "Slack"), ("../vscode/", "VS Code")],
        "official": "https://help.figma.com/hc/en-us/articles/360040328753-Keyboard-shortcuts-in-Figma",
    },
    "slack": {
        "title": "Slack Keyboard Shortcuts 2026 | Complete Cheat Sheet for Windows & Mac",
        "og_title": "Slack Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "Slack Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "Slack Keyboard Shortcuts",
        "about_name": "Slack",
        "about_category": "BusinessApplication",
        "about_os": "Windows, macOS, Web",
        "about_url": "https://slack.com",
        "intro": "Every essential <strong>Slack</strong> keyboard shortcut—channels, threads, search, formatting, and navigation. From <a href=\"https://slack.com/help/articles/201746348-Slack-keyboard-shortcuts\" target=\"_blank\" rel=\"noopener\">Slack's official shortcut documentation</a>.",
        "seo_h2": "Why Slack Shortcuts Matter (2026)",
        "seo_p": "Ctrl/Cmd+K opens Quick Switcher to jump anywhere. Ctrl/Cmd+Shift+K starts a direct message. Ctrl/Cmd+/ shows all shortcuts in-app. Power users never click the sidebar. Also see <a href=\"../discord/\">Discord</a>, <a href=\"../zoom/\">Zoom</a>, and <a href=\"../notion/\">Notion</a>.",
        "faqs": [
            ("What is the most important Slack keyboard shortcut?", "Ctrl/Cmd+K opens Quick Switcher—you can jump to any channel, DM, or person by typing their name."),
            ("How do I mark messages unread in Slack?", "Press Alt+Shift+U on Windows or Option+Shift+U on Mac while viewing a channel or DM."),
            ("How do I see all Slack keyboard shortcuts?", "Press Ctrl+/ on Windows or Cmd+/ on Mac inside Slack to open the full keyboard shortcuts reference."),
            ("Are Slack shortcuts the same on Mac and Windows?", "Most shortcuts map Ctrl to Cmd. Slack documents platform-specific bindings in their help center."),
        ],
        "related": "Discord • Zoom • Notion • Linear",
        "related_links": [("../discord/", "Discord"), ("../zoom/", "Zoom"), ("../notion/", "Notion"), ("../linear/", "Linear")],
        "official": "https://slack.com/help/articles/201746348-Slack-keyboard-shortcuts",
    },
    "notion": {
        "title": "Notion Keyboard Shortcuts 2026 | Complete Cheat Sheet for Windows & Mac",
        "og_title": "Notion Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "Notion Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "Notion Keyboard Shortcuts",
        "about_name": "Notion",
        "about_category": "BusinessApplication",
        "about_os": "Windows, macOS, Web",
        "about_url": "https://www.notion.so",
        "intro": "Every essential <strong>Notion</strong> keyboard shortcut—blocks, pages, databases, toggles, and navigation. From <a href=\"https://www.notion.so/help/keyboard-shortcuts\" target=\"_blank\" rel=\"noopener\">Notion's official keyboard shortcuts help</a>.",
        "seo_h2": "Why Notion Shortcuts Matter (2026)",
        "seo_p": "Type / to insert any block, Ctrl/Cmd+P to quick-find pages, and Ctrl/Cmd+Shift+L to toggle dark mode. Database power users rely on Ctrl/Cmd+Enter to open pages and Esc to go back. Combine with <a href=\"../linear/\">Linear</a>, <a href=\"../slack/\">Slack</a>, and <a href=\"../raycast/\">Raycast</a>.",
        "faqs": [
            ("What are the most useful Notion keyboard shortcuts?", "Ctrl/Cmd+P (quick find), / (slash menu for blocks), Ctrl/Cmd+Shift+N (new window), Ctrl/Cmd+[ (back), and Ctrl/Cmd+Shift+L (dark mode toggle) are daily essentials."),
            ("How do I create a new page in Notion with a keyboard shortcut?", "Press Ctrl/Cmd+N for a new page in the current workspace, or Ctrl/Cmd+Shift+N to open a new Notion window."),
            ("How do I navigate back in Notion?", "Press Ctrl/Cmd+[ to go back to the previous page, or Ctrl/Cmd+] to go forward."),
            ("Are Notion shortcuts the same on Mac and Windows?", "Yes—Notion maps Ctrl on Windows to Cmd on Mac for most commands. Single-key shortcuts like / for the block menu work identically."),
        ],
        "related": "Linear • Slack • Raycast • Figma",
        "related_links": [("../linear/", "Linear"), ("../slack/", "Slack"), ("../raycast/", "Raycast"), ("../figma/", "Figma")],
        "official": "https://www.notion.so/help/keyboard-shortcuts",
    },
    "excel": {
        "title": "Excel Keyboard Shortcuts 2026 | 100+ Essential Shortcuts for Windows & Mac",
        "og_title": "Excel Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "Excel Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "Excel Keyboard Shortcuts",
        "about_name": "Microsoft Excel",
        "about_category": "BusinessApplication",
        "about_os": "Windows, macOS",
        "about_url": "https://www.microsoft.com/microsoft-365/excel",
        "intro": "Master <strong>Microsoft Excel</strong> with 100+ keyboard shortcuts for formulas, navigation, formatting, and data analysis. Windows and Mac bindings side-by-side, from <a href=\"https://support.microsoft.com/en-us/office/keyboard-shortcuts-in-excel-1798f9aa-842a-4753-a996-39637648c272\" target=\"_blank\" rel=\"noopener\">Microsoft's official Excel shortcut reference</a>.",
        "seo_h2": "Why Excel Shortcuts Matter (2026)",
        "seo_p": "Ctrl/Cmd+Arrow keys jump to data boundaries, F2 edits a cell, Alt+= runs AutoSum, and Ctrl/Cmd+Shift+L toggles filters. Spreadsheet power users save hours weekly. Also see <a href=\"../google-sheets/\">Google Sheets</a> and <a href=\"../windows/\">Windows</a> shortcuts.",
        "faqs": [
            ("What are the most useful Excel keyboard shortcuts?", "Ctrl/Cmd+C/V (copy/paste), Ctrl/Cmd+Z (undo), F2 (edit cell), Ctrl/Cmd+Arrow (navigate), Alt+= (AutoSum), Ctrl/Cmd+Shift+L (filter), and Ctrl/Cmd+1 (format cells) are the essentials."),
            ("How do I quickly navigate in Excel?", "Use Ctrl/Cmd+Arrow keys to jump to the edge of data regions, Ctrl+Home (A1), Ctrl+End (last used cell), and Ctrl+Page Up/Down to switch worksheets."),
            ("How do I insert today's date in Excel with a shortcut?", "Press Ctrl+; (semicolon) to insert today's date. Ctrl+Shift+: inserts the current time."),
            ("Are Excel shortcuts the same on Mac and Windows?", "Most shortcuts map Ctrl to Cmd on Mac. Some differences exist—F-keys and Alt-based shortcuts differ. Check the platform tab for your OS."),
        ],
        "related": "Google Sheets • Windows • Gmail • Outlook",
        "related_links": [("../google-sheets/", "Google Sheets"), ("../windows/", "Windows"), ("../gmail/", "Gmail"), ("../outlook/", "Outlook")],
        "official": "https://support.microsoft.com/en-us/office/keyboard-shortcuts-in-excel-1798f9aa-842a-4753-a996-39637648c272",
    },
    "gmail": {
        "title": "Gmail Keyboard Shortcuts 2026 | Complete Cheat Sheet for Web & Desktop",
        "og_title": "Gmail Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "Gmail Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "Gmail Keyboard Shortcuts",
        "about_name": "Gmail",
        "about_category": "BusinessApplication",
        "about_os": "Web, Windows, macOS",
        "about_url": "https://mail.google.com",
        "intro": "Every essential <strong>Gmail</strong> keyboard shortcut—compose, archive, search, labels, and navigation. Enable shortcuts in Settings first. From <a href=\"https://support.google.com/mail/answer/6594\" target=\"_blank\" rel=\"noopener\">Google's official Gmail shortcut list</a>.",
        "seo_h2": "Why Gmail Shortcuts Matter (2026)",
        "seo_p": "Single-key shortcuts (C compose, R reply, A reply all, E archive, / search) make inbox zero achievable. Enable them under Settings → See all settings → Keyboard shortcuts → ON. Pair with <a href=\"../outlook/\">Outlook</a> and <a href=\"../chrome/\">Chrome</a> guides.",
        "faqs": [
            ("How do I enable Gmail keyboard shortcuts?", "Go to Gmail Settings → See all settings → General → Keyboard shortcuts → select 'Keyboard shortcuts on' → Save Changes."),
            ("What are the best Gmail keyboard shortcuts?", "C (compose), R (reply), A (reply all), F (forward), E (archive), # (delete), / (search), and G then I (go to inbox) cover daily email workflows."),
            ("How do I archive an email in Gmail with a keyboard shortcut?", "Select an email and press E to archive it. Press Z to undo the last action."),
            ("Are Gmail shortcuts the same on Mac and Windows?", "Yes—Gmail uses single-letter shortcuts that work identically on all platforms once enabled in settings."),
        ],
        "related": "Outlook • Chrome • Slack • Notion",
        "related_links": [("../outlook/", "Outlook"), ("../chrome/", "Chrome"), ("../slack/", "Slack"), ("../notion/", "Notion")],
        "official": "https://support.google.com/mail/answer/6594",
    },
    "outlook": {
        "title": "Outlook Keyboard Shortcuts 2026 | Complete Cheat Sheet for Windows & Mac",
        "og_title": "Outlook Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "Outlook Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "Outlook Keyboard Shortcuts",
        "about_name": "Microsoft Outlook",
        "about_category": "BusinessApplication",
        "about_os": "Windows, macOS, Web",
        "about_url": "https://www.microsoft.com/microsoft-365/outlook",
        "intro": "Master <strong>Microsoft Outlook</strong> with every essential keyboard shortcut—email, calendar, contacts, and search. From <a href=\"https://support.microsoft.com/en-us/office/keyboard-shortcuts-for-outlook-dced2ace-2eff-4a40-a034-454377174117\" target=\"_blank\" rel=\"noopener\">Microsoft's official Outlook shortcut reference</a>.",
        "seo_h2": "Why Outlook Shortcuts Matter (2026)",
        "seo_p": "Ctrl/Cmd+N composes new mail, Ctrl/Cmd+Enter sends, Ctrl/Cmd+Shift+M creates a meeting, and Ctrl/Cmd+1/2/3 switches between Mail, Calendar, and Contacts. Enterprise users process hundreds of emails daily—shortcuts are non-negotiable. See also <a href=\"../gmail/\">Gmail</a> and <a href=\"../microsoft-teams/\">Microsoft Teams</a>.",
        "faqs": [
            ("What are the most useful Outlook keyboard shortcuts?", "Ctrl/Cmd+N (new email), Ctrl/Cmd+Enter (send), Ctrl/Cmd+R (reply), Ctrl/Cmd+Shift+R (reply all), Delete (delete message), and Ctrl/Cmd+Shift+M (new meeting) are daily essentials."),
            ("How do I switch between Mail and Calendar in Outlook?", "Press Ctrl/Cmd+1 for Mail, Ctrl/Cmd+2 for Calendar, and Ctrl/Cmd+3 for Contacts."),
            ("How do I search in Outlook with a keyboard shortcut?", "Press Ctrl/Cmd+E or F3 to jump to the search box in the current Outlook view."),
            ("Are Outlook shortcuts the same on Mac and Windows?", "Most shortcuts map Ctrl to Cmd on Mac. Microsoft documents both keymaps in their official Outlook help center."),
        ],
        "related": "Gmail • Microsoft Teams • Zoom • Windows",
        "related_links": [("../gmail/", "Gmail"), ("../microsoft-teams/", "Microsoft Teams"), ("../zoom/", "Zoom"), ("../windows/", "Windows")],
        "official": "https://support.microsoft.com/en-us/office/keyboard-shortcuts-for-outlook-dced2ace-2eff-4a40-a034-454377174117",
    },
    "microsoft-teams": {
        "title": "Microsoft Teams Keyboard Shortcuts 2026 | Complete Cheat Sheet",
        "og_title": "Microsoft Teams Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "Microsoft Teams Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "Microsoft Teams Keyboard Shortcuts",
        "about_name": "Microsoft Teams",
        "about_category": "BusinessApplication",
        "about_os": "Windows, macOS, Web",
        "about_url": "https://www.microsoft.com/microsoft-teams",
        "intro": "Every essential <strong>Microsoft Teams</strong> keyboard shortcut—meetings, chat, calls, and navigation. From <a href=\"https://support.microsoft.com/en-us/office/keyboard-shortcuts-for-microsoft-teams-3e173951-6394-4a69-8873-3708023a5c55\" target=\"_blank\" rel=\"noopener\">Microsoft's official Teams shortcut list</a>.",
        "seo_h2": "Why Microsoft Teams Shortcuts Matter (2026)",
        "seo_p": "Ctrl/Cmd+E opens search, Ctrl/Cmd+N starts a new chat, Ctrl/Cmd+Shift+M toggles mute in meetings, and Ctrl/Cmd+Shift+O toggles video. Enterprise Teams users live in the app all day—shortcuts cut friction on every call. Compare with <a href=\"../zoom/\">Zoom</a> and <a href=\"../slack/\">Slack</a>.",
        "faqs": [
            ("What are the most useful Microsoft Teams keyboard shortcuts?", "Ctrl/Cmd+E (search), Ctrl/Cmd+N (new chat), Ctrl/Cmd+Shift+M (mute in meeting), Ctrl/Cmd+Shift+O (toggle video), and Ctrl/Cmd+6 (go to files) are daily essentials."),
            ("How do I mute myself in a Teams meeting with a keyboard shortcut?", "Press Ctrl/Cmd+Shift+M to toggle your microphone mute during an active Teams meeting."),
            ("How do I navigate between Teams sections?", "Press Ctrl/Cmd+1 through Ctrl/Cmd+6 to jump between Activity, Chat, Teams, Calendar, Calls, and Files."),
            ("Are Teams shortcuts the same on Mac and Windows?", "Most shortcuts map Ctrl to Cmd on Mac. Microsoft documents platform-specific bindings in their Teams help center."),
        ],
        "related": "Zoom • Slack • Outlook • Zoom",
        "related_links": [("../zoom/", "Zoom"), ("../slack/", "Slack"), ("../outlook/", "Outlook"), ("../gmail/", "Gmail")],
        "official": "https://support.microsoft.com/en-us/office/keyboard-shortcuts-for-microsoft-teams-3e173951-6394-4a69-8873-3708023a5c55",
    },
    "obs-studio": {
        "title": "OBS Studio Keyboard Shortcuts 2026 | Complete Cheat Sheet for Streamers",
        "og_title": "OBS Studio Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "headline": "OBS Studio Keyboard Shortcuts 2026 — Complete Cheat Sheet",
        "breadcrumb": "OBS Studio Keyboard Shortcuts",
        "about_name": "OBS Studio",
        "about_category": "MultimediaApplication",
        "about_os": "Windows, macOS, Linux",
        "about_url": "https://obsproject.com",
        "intro": "Every essential <strong>OBS Studio</strong> keyboard shortcut—streaming, recording, scenes, sources, and audio. From <a href=\"https://obsproject.com/kb/shortcuts\" target=\"_blank\" rel=\"noopener\">OBS official documentation</a>.",
        "seo_h2": "Why OBS Studio Shortcuts Matter (2026)",
        "seo_p": "Streamers need instant scene switches and mute toggles without alt-tabbing. OBS hotkeys are fully customizable under Settings → Hotkeys. Default bindings vary by setup—this guide covers the most common streaming workflows. Also see <a href=\"../discord/\">Discord</a> and <a href=\"../zoom/\">Zoom</a>.",
        "faqs": [
            ("How do I set up hotkeys in OBS Studio?", "Go to Settings → Hotkeys and assign keyboard shortcuts to any OBS action—start streaming, switch scenes, mute mic, and more."),
            ("What are the default OBS Studio keyboard shortcuts?", "OBS has no universal defaults—hotkeys are user-defined. Common setups bind F1-F12 to scene switches and Ctrl+Shift+S to start/stop streaming."),
            ("Can I use OBS hotkeys while gaming?", "Yes, if you enable 'Hotkeys focus behavior' appropriately. Global hotkeys work even when OBS is not the active window."),
            ("Are OBS shortcuts the same on Mac and Windows?", "OBS hotkeys are fully customizable and platform-independent once configured in Settings → Hotkeys."),
        ],
        "related": "Discord • Zoom • Photoshop • Chrome",
        "related_links": [("../discord/", "Discord"), ("../zoom/", "Zoom"), ("../photoshop/", "Photoshop"), ("../chrome/", "Chrome")],
        "official": "https://obsproject.com/kb/shortcuts",
    },
}


def faq_schema(faqs):
    items = []
    for q, a in faqs:
        items.append(
            f'        {{\n          "@type": "Question",\n          "name": "{q}",\n          "acceptedAnswer": {{"@type":"Answer","text":"{a}"}}\n        }}'
        )
    return ",\n".join(items)


def head_schema(meta, slug):
    url = f"https://fastshortcuts.com/shortcuts/{slug}/"
    faqs = meta["faqs"]
    desc = meta["seo_p"].replace('"', "'")[:200]
    return f"""
    <script type="application/ld+json">
    {{
      "@context": "https://schema.org",
      "@type": "BreadcrumbList",
      "itemListElement": [
        {{"@type":"ListItem","position":1,"name":"Home","item":"https://fastshortcuts.com"}},
        {{"@type":"ListItem","position":2,"name":"Shortcuts","item":"https://fastshortcuts.com/#categories"}},
        {{"@type":"ListItem","position":3,"name":"{meta['breadcrumb']}","item":"{url}"}}
      ]
    }}
    </script>

    <script type="application/ld+json">
    {{
      "@context": "https://schema.org",
      "@type": "TechArticle",
      "headline": "{meta['headline']}",
      "description": "{desc}",
      "author": {{"@type":"Organization","name":"FastShortcuts","url":"https://fastshortcuts.com"}},
      "publisher": {{"@type":"Organization","name":"FastShortcuts","logo":{{"@type":"ImageObject","url":"https://fastshortcuts.com/logo.png"}}}},
      "datePublished": "{DATE}",
      "dateModified": "{DATE}",
      "mainEntityOfPage": {{"@type":"WebPage","@id":"{url}"}},
      "keywords": "{meta['about_name']}, keyboard shortcuts, cheat sheet",
      "articleSection": "Productivity Tools",
      "about": {{
        "@type": "SoftwareApplication",
        "name": "{meta['about_name']}",
        "applicationCategory": "{meta['about_category']}",
        "operatingSystem": "{meta['about_os']}",
        "url": "{meta['about_url']}"
      }}
    }}
    </script>

    <script type="application/ld+json">
    {{
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [
{faq_schema(faqs)}
      ]
    }}
    </script>"""


def seo_section(meta):
    return f"""
        <section class="content-section" style="padding-top:0.5rem;">
            <div class="content-container">
                <article class="seo-content">
                    <h2>{meta['seo_h2']}</h2>
                    <p>{meta['seo_p']}</p>
                </article>
            </div>
        </section>
"""


def faq_section(meta):
    details = []
    for q, a in meta["faqs"]:
        details.append(
            f"""                <details style="background:var(--bg-secondary);border:1px solid var(--border-color);border-radius:10px;padding:1.25rem 1.5rem;">
                    <summary style="font-weight:600;color:var(--text-primary);cursor:pointer;list-style:none;">{q}</summary>
                    <p style="margin-top:0.75rem;color:var(--text-secondary);line-height:1.6;">{a}</p>
                </details>"""
        )
    return f"""
        <section id="faq" style="padding:3rem 1.5rem;max-width:860px;margin:0 auto;">
            <div style="text-align:center;margin-bottom:2rem;">
                <h2 style="font-size:1.6rem;font-weight:700;color:var(--text-primary);">{meta['about_name']} Shortcuts — Frequently Asked Questions</h2>
            </div>
            <div style="display:flex;flex-direction:column;gap:1rem;">
{chr(10).join(details)}
            </div>
        </section>
"""


def upgrade_file(slug, meta):
    path = ROOT / "shortcuts" / slug / "index.html"
    content = path.read_text(encoding="utf-8")

    # Titles and meta: 2025 -> 2026 in head tags
    content = re.sub(
        r"<title>[^<]*2025[^<]*</title>",
        f"<title>{meta['title']}</title>",
        content,
        count=1,
    )
    content = content.replace("2025 - Complete Guide", "2026 — Complete Cheat Sheet")
    content = content.replace("2025 |", "2026 |")
    content = content.replace("| FastShortcuts 2025", "| FastShortcuts 2026")
    content = content.replace("Keyboard Shortcuts 2025", "Keyboard Shortcuts 2026")
    content = content.replace("Shortcuts 2025", "Shortcuts 2026")
    content = content.replace("&copy; 2025 FastShortcuts", "&copy; 2026 FastShortcuts")

    # Update schema dates
    content = re.sub(r'"dateModified":\s*"[^"]*"', f'"dateModified": "{DATE}"', content)
    content = re.sub(r'"headline":\s*"[^"]*2025[^"]*"', f'"headline": "{meta["headline"]}"', content)

    # OG titles
    if 'property="og:title"' in content:
        content = re.sub(
            r'<meta property="og:title" content="[^"]*">',
            f'<meta property="og:title" content="{meta["og_title"]}">',
            content,
            count=1,
        )
    if 'name="twitter:title"' in content:
        content = re.sub(
            r'<meta name="twitter:title" content="[^"]*">',
            f'<meta name="twitter:title" content="{meta["og_title"]}">',
            content,
            count=1,
        )

    # Add head schema for zoom (missing entirely)
    if meta.get("needs_head_schema"):
        insert = head_schema(meta, slug)
        content = content.replace(
            '    <link rel="stylesheet" href="../../assets/css/styles.css">\n</head>',
            f'    <link rel="stylesheet" href="../../assets/css/styles.css">{insert}\n</head>',
        )
    elif 'id="faq"' not in content:
        # Replace or append FAQ schema if missing visible FAQ
        if '"@type": "FAQPage"' not in content:
            insert = f"""
    <script type="application/ld+json">
    {{
      "@context": "https://schema.org",
      "@type": "FAQPage",
      "mainEntity": [
{faq_schema(meta['faqs'])}
      ]
    }}
    </script>"""
            content = content.replace("</head>", insert + "\n</head>", 1)

    # Update page description intro
    content = re.sub(
        r'<p class="page-description">[^<]*(?:<[^/][^>]*>[^<]*)*</p>',
        f'<p class="page-description">{meta["intro"]}</p>',
        content,
        count=1,
    )

    # Insert seo-content before search-container
    if "seo-content" not in content:
        content = content.replace(
            '\n        <div class="search-container">',
            seo_section(meta) + '\n        <div class="search-container">',
            1,
        )

    # Insert FAQ before related-shortcuts
    if 'id="faq"' not in content:
        content = content.replace(
            '\n        <section class="related-shortcuts">',
            faq_section(meta) + '\n        <section class="related-shortcuts">',
            1,
        )

    # Update related links section if present
    links_html = " • ".join(
        f'<a href="{href}" style="color:var(--primary-color);text-decoration:none;font-weight:600;">{label}</a>'
        for href, label in meta["related_links"]
    )
    content = re.sub(
        r'<section style="padding: 2rem[^"]*"[^>]*>\s*<p[^>]*>[^<]*(?:<a[^>]*>[^<]*</a>[^<]*)*</p>\s*</section>',
        f'<section style="padding:2rem;text-align:center;background:var(--bg-secondary);">\n            <p style="font-size:1.1rem;color:var(--text-primary);margin:0;">Also see: {links_html}</p>\n        </section>',
        content,
        count=1,
        flags=re.DOTALL,
    )

    path.write_text(content, encoding="utf-8")
    print(f"Upgraded {slug}")


def update_sitemap_dates():
    sitemap = ROOT / "sitemap.xml"
    text = sitemap.read_text(encoding="utf-8")
    for slug in PAGES:
        text = re.sub(
            rf"(<loc>https://fastshortcuts.com/shortcuts/{slug}/</loc>\s*\n\s*<lastmod>)[^<]+(</lastmod>)",
            rf"\g<1>{DATE}\g<2>",
            text,
        )
    sitemap.write_text(text, encoding="utf-8")
    print("Updated sitemap lastmod dates")


if __name__ == "__main__":
    for slug, meta in PAGES.items():
        upgrade_file(slug, meta)
    update_sitemap_dates()
