// Navbar scroll effect
window.addEventListener('scroll', function() {
    const navbar = document.getElementById('navbar');
    if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
    } else {
        navbar.classList.remove('scrolled');
    }
});

// Mobile Menu Toggle
document.addEventListener('DOMContentLoaded', function() {
    const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
    const mobileMenu = document.querySelector('.mobile-menu');
    const mobileMenuOverlay = document.querySelector('.mobile-menu-overlay');
    const mobileMenuClose = document.querySelector('.mobile-menu-close');
    const mobileNavLinks = document.querySelectorAll('.mobile-nav-links a');
    
    if (mobileMenuBtn && mobileMenu && mobileMenuOverlay) {
        // Open mobile menu
        mobileMenuBtn.addEventListener('click', function() {
            mobileMenu.classList.add('active');
            mobileMenuOverlay.classList.add('active');
            document.body.style.overflow = 'hidden';
        });
        
        // Close mobile menu
        function closeMobileMenu() {
            mobileMenu.classList.remove('active');
            mobileMenuOverlay.classList.remove('active');
            document.body.style.overflow = '';
        }
        
        if (mobileMenuClose) {
            mobileMenuClose.addEventListener('click', closeMobileMenu);
        }
        
        if (mobileMenuOverlay) {
            mobileMenuOverlay.addEventListener('click', closeMobileMenu);
        }
        
        // Close menu when clicking on a link
        mobileNavLinks.forEach(link => {
            link.addEventListener('click', closeMobileMenu);
        });
        
        // Close menu on escape key
        document.addEventListener('keydown', function(e) {
            if (e.key === 'Escape') {
                closeMobileMenu();
            }
        });
    }
});

// Demo Search Animation (for homepage)
function initDemoAnimation() {
    const demoInput = document.querySelector('.demo-search-input');
    const demoMouseCursor = document.querySelector('.demo-mouse-cursor');
    const firstCopyBtn = document.querySelector('.demo-shortcut-item:first-child .demo-copy-btn');
    const firstShortcutItem = document.querySelector('.demo-shortcut-item:first-child');
    
    if (!demoInput) return;
    
    const searchText = "copy line";
    let charIndex = 0;
    
    // Start typing animation after a short delay
    setTimeout(() => {
        demoInput.classList.add('typing');
        
        const typingInterval = setInterval(() => {
            if (charIndex < searchText.length) {
                demoInput.value = searchText.substring(0, charIndex + 1);
                charIndex++;
            } else {
                clearInterval(typingInterval);
                demoInput.classList.remove('typing');
            }
        }, 150); // Type one character every 150ms
    }, 1000); // Wait 1 second before starting
    
    // Show mouse cursor moving to copy button
    if (demoMouseCursor) {
        setTimeout(() => {
            demoMouseCursor.classList.add('moving');
        }, 2300);
    }
    
    // Highlight first item and click copy button
    if (firstShortcutItem && firstCopyBtn) {
        setTimeout(() => {
            firstShortcutItem.classList.add('highlight');
        }, 2500);
        
        setTimeout(() => {
            firstCopyBtn.classList.add('clicked');
            firstCopyBtn.innerHTML = '✓';
            
            // Reset after showing success
            setTimeout(() => {
                firstCopyBtn.classList.remove('clicked');
                firstCopyBtn.innerHTML = '📋';
                firstShortcutItem.classList.remove('highlight');
                
                // Loop the animation
                setTimeout(() => {
                    // Reset input
                    demoInput.value = '';
                    charIndex = 0;
                    initDemoAnimation();
                }, 2000);
            }, 1000);
        }, 3800);
    }
}

// Theme Toggle - REMOVED (Using light theme only)

// Copy to Clipboard
function addCopyButtons() {
    const shortcutItems = document.querySelectorAll('.shortcut-item');
    
    shortcutItems.forEach(item => {
        const copyBtn = document.createElement('button');
        copyBtn.className = 'copy-btn';
        copyBtn.innerHTML = '📋 Copy';
        copyBtn.setAttribute('title', 'Copy shortcut');
        
        copyBtn.addEventListener('click', function(e) {
            e.stopPropagation();
            
            const description = item.querySelector('.shortcut-description').textContent;
            const keys = Array.from(item.querySelectorAll('.key'))
                .map(key => key.textContent)
                .join(' + ');
            
            const textToCopy = `${description}: ${keys}`;
            
            navigator.clipboard.writeText(textToCopy).then(() => {
                copyBtn.innerHTML = '✅ Copied!';
                copyBtn.classList.add('copied');
                
                setTimeout(() => {
                    copyBtn.innerHTML = '📋 Copy';
                    copyBtn.classList.remove('copied');
                }, 2000);
            });
        });
        
        const keysContainer = item.querySelector('.shortcut-keys');
        if (keysContainer) {
            keysContainer.appendChild(copyBtn);
        }
    });
}

// Print Page
// PDF Download functionality using jsPDF
function initPDFDownload() {
    const pdfBtn = document.querySelector('.pdf-download-btn');
    if (pdfBtn) {
        pdfBtn.addEventListener('click', async function() {
            // Show loading state
            const originalText = pdfBtn.innerHTML;
            pdfBtn.innerHTML = '⏳';
            pdfBtn.disabled = true;
            
            try {
                // Load jsPDF library dynamically
                if (typeof jspdf === 'undefined') {
                    const script = document.createElement('script');
                    script.src = 'https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js';
                    document.head.appendChild(script);
                    await new Promise(resolve => script.onload = resolve);
                }
                
                const { jsPDF } = window.jspdf;
                const doc = new jsPDF();
                
                // Get page title
                const pageTitle = document.querySelector('.page-title')?.textContent || 'Keyboard Shortcuts';
                
                // Get all shortcuts
                const shortcuts = [];
                document.querySelectorAll('.shortcut-group').forEach(group => {
                    const groupTitle = group.querySelector('.group-title')?.textContent || '';
                    const items = group.querySelectorAll('.shortcut-item');
                    
                    shortcuts.push({ type: 'group', text: groupTitle });
                    
                    items.forEach(item => {
                        const description = item.querySelector('.shortcut-description')?.textContent || '';
                        const keys = Array.from(item.querySelectorAll('.key')).map(k => k.textContent).join(' + ');
                        const platform = item.querySelector('.platform-badge')?.textContent || '';
                        shortcuts.push({ type: 'item', description, keys, platform });
                    });
                });
                
                // Build PDF
                let y = 20;
                doc.setFontSize(20);
                doc.text(pageTitle, 20, y);
                y += 15;
                
                doc.setFontSize(10);
                doc.text('Generated from FastShortcuts.com', 20, y);
                y += 15;
                
                shortcuts.forEach(item => {
                    if (y > 270) {
                        doc.addPage();
                        y = 20;
                    }
                    
                    if (item.type === 'group') {
                        doc.setFontSize(14);
                        doc.setFont(undefined, 'bold');
                        doc.text(item.text, 20, y);
                        y += 10;
                    } else {
                        doc.setFontSize(10);
                        doc.setFont(undefined, 'normal');
                        doc.text(`${item.description}`, 20, y);
                        doc.text(`${item.keys} ${item.platform}`, 120, y);
                        y += 7;
                    }
                });
                
                // Download PDF
                const filename = pageTitle.replace(/[^a-z0-9]/gi, '_').toLowerCase() + '.pdf';
                doc.save(filename);
                
            } catch (error) {
                console.error('PDF generation error:', error);
                alert('Failed to generate PDF. Please try again.');
            } finally {
                pdfBtn.innerHTML = originalText;
                pdfBtn.disabled = false;
            }
        });
    }
}

// Initialize all features
document.addEventListener('DOMContentLoaded', function() {
    addCopyButtons();
    initPDFDownload();
});

// Smooth scrolling for anchor links
document.querySelectorAll('a[href^="#"]').forEach(anchor => {
    anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
            target.scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    });
});

// Intersection Observer for animations
const observerOptions = {
    threshold: 0.1,
    rootMargin: '0px 0px -50px 0px'
};

const observer = new IntersectionObserver(function(entries) {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.style.opacity = '1';
            entry.target.style.transform = 'translateY(0)';
        }
    });
}, observerOptions);

// Observe all category cards and feature items
document.querySelectorAll('.category-card, .feature-item').forEach(el => {
    el.style.opacity = '0';
    el.style.transform = 'translateY(20px)';
    el.style.transition = 'opacity 0.6s ease, transform 0.6s ease';
    observer.observe(el);
});

// Search functionality for shortcut pages
const searchInput = document.querySelector('.search-input');
if (searchInput) {
    searchInput.addEventListener('input', function() {
        const searchTerm = this.value.toLowerCase().trim();
        const shortcutItems = document.querySelectorAll('.shortcut-item');
        const shortcutGroups = document.querySelectorAll('.shortcut-group');
        let visibleCount = 0;

        shortcutGroups.forEach(group => {
            let hasVisibleShortcuts = false;
            const groupItems = group.querySelectorAll('.shortcut-item');

            groupItems.forEach(item => {
                const description = item.querySelector('.shortcut-description').textContent.toLowerCase();
                const keys = Array.from(item.querySelectorAll('.key'))
                    .map(key => key.textContent.toLowerCase())
                    .join(' ');

                if (searchTerm === '' || description.includes(searchTerm) || keys.includes(searchTerm)) {
                    item.style.display = 'flex';
                    hasVisibleShortcuts = true;
                } else {
                    item.style.display = 'none';
                }
            });

            if (hasVisibleShortcuts) {
                group.style.display = 'block';
                visibleCount++;
            } else {
                group.style.display = 'none';
            }
        });

        const noResults = document.querySelector('.no-results');
        if (noResults) {
            noResults.style.display = visibleCount === 0 && searchTerm !== '' ? 'block' : 'none';
        }
    });
}

// Mobile menu toggle (basic implementation)
const mobileMenuBtn = document.querySelector('.mobile-menu-btn');
const navLinks = document.querySelector('.nav-links');

if (mobileMenuBtn) {
    mobileMenuBtn.addEventListener('click', function() {
        navLinks.style.display = navLinks.style.display === 'flex' ? 'none' : 'flex';
    });
}

// Initialize demo animation on page load
if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', initDemoAnimation);
} else {
    initDemoAnimation();
}

// Related Shortcuts - Dynamic Population
document.addEventListener('DOMContentLoaded', function() {
    const relatedGrid = document.querySelector('.related-grid');
    
    if (!relatedGrid) return;
    
    // All shortcut pages with metadata (ordered by date - newest first)
    const allShortcuts = [
        {
            name: 'Photoshop',
            path: '../photoshop/',
            icon: '🎨',
            description: 'Master Adobe Photoshop with 70+ essential keyboard shortcuts for faster photo editing and design workflows.',
            badge: 'New',
            date: '2024-12-06'
        },
        {
            name: 'Sublime Text',
            path: '../sublime/',
            icon: '📝',
            description: 'Boost productivity with Sublime Text shortcuts for editing, navigation, and multi-cursor operations.',
            badge: 'Popular',
            date: '2024-11-29'
        },
        {
            name: 'IntelliJ IDEA',
            path: '../intellij/',
            icon: '💡',
            description: 'Speed up Java development with IntelliJ IDEA keyboard shortcuts for coding, debugging, and refactoring.',
            badge: 'Developer',
            date: '2024-11-29'
        },
        {
            name: 'Chrome',
            path: '../chrome/',
            icon: '🌐',
            description: 'Navigate faster with Chrome browser shortcuts for tabs, bookmarks, and developer tools.',
            badge: 'Essential',
            date: '2024-11-29'
        },
        {
            name: 'Mac',
            path: '../mac/',
            icon: '🍎',
            description: 'Master macOS with essential keyboard shortcuts for Finder, Spotlight, Mission Control, and more.',
            badge: 'System',
            date: '2024-11-28'
        },
        {
            name: 'Windows',
            path: '../windows/',
            icon: '🪟',
            description: 'Increase Windows productivity with shortcuts for taskbar, File Explorer, virtual desktops, and more.',
            badge: 'System',
            date: '2024-11-28'
        },
        {
            name: 'VS Code',
            path: '../vscode/',
            icon: '💻',
            description: 'Code faster with VS Code shortcuts for editing, debugging, Git integration, and extensions.',
            badge: 'Developer',
            date: '2024-11-28'
        }
    ];
    
    // Get current page
    const currentPath = window.location.pathname;
    const currentPageName = currentPath.split('/').filter(p => p).pop() || currentPath.split('/').slice(-2, -1)[0];
    
    // Filter out current page and get 3 latest shortcuts
    const relatedShortcuts = allShortcuts
        .filter(shortcut => {
            const shortcutName = shortcut.path.split('/').filter(p => p).pop();
            return shortcutName !== currentPageName;
        })
        .slice(0, 3); // Get first 3 (already sorted by date, newest first)
    
    // Populate the grid
    relatedShortcuts.forEach(shortcut => {
        const card = document.createElement('a');
        card.href = shortcut.path;
        card.className = 'related-card';
        
        card.innerHTML = `
            <div class="related-card-icon">${shortcut.icon}</div>
            <span class="related-card-badge">${shortcut.badge}</span>
            <h3>${shortcut.name} Shortcuts</h3>
            <p>${shortcut.description}</p>
            <span class="related-card-cta">Explore ${shortcut.name}</span>
        `;
        
        relatedGrid.appendChild(card);
    });
});
