# Schema Markup Templates for Shortcut Pages

This file contains Schema.org JSON-LD templates to add to each shortcut page.

## Template for Windows Shortcuts Page

```html
<!-- Add before </head> tag in shortcuts/windows/index.html -->

<!-- Breadcrumb Schema (JSON-LD) -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://fastshortcuts.com"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Shortcuts",
      "item": "https://fastshortcuts.com/#categories"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "Windows Shortcuts",
      "item": "https://fastshortcuts.com/shortcuts/windows/"
    }
  ]
}
</script>

<!-- TechArticle Schema -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "TechArticle",
  "headline": "Windows Keyboard Shortcuts 2025 - Complete Guide",
  "description": "Master Windows 11/10 with 40+ keyboard shortcuts. Navigate faster and boost productivity.",
  "author": {
    "@type": "Organization",
    "name": "FastShortcuts"
  },
  "publisher": {
    "@type": "Organization",
    "name": "FastShortcuts",
    "logo": {
      "@type": "ImageObject",
      "url": "https://fastshortcuts.com/logo.png"
    }
  },
  "datePublished": "2024-11-29",
  "dateModified": "2025-11-29",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://fastshortcuts.com/shortcuts/windows/"
  },
  "keywords": "Windows shortcuts, Windows 11, keyboard shortcuts, productivity",
  "articleSection": "Operating Systems",
  "about": {
    "@type": "SoftwareApplication",
    "name": "Microsoft Windows",
    "operatingSystem": "Windows",
    "applicationCategory": "OperatingSystem"
  }
}
</script>
```

## Template for Mac Shortcuts Page

```html
<!-- Add before </head> tag in shortcuts/mac/index.html -->

<!-- Breadcrumb Schema (JSON-LD) -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://fastshortcuts.com"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Shortcuts",
      "item": "https://fastshortcuts.com/#categories"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "macOS Shortcuts",
      "item": "https://fastshortcuts.com/shortcuts/mac/"
    }
  ]
}
</script>

<!-- TechArticle Schema -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "TechArticle",
  "headline": "macOS Keyboard Shortcuts 2025 - Complete Guide",
  "description": "Master macOS with 40+ keyboard shortcuts for productivity and navigation.",
  "author": {
    "@type": "Organization",
    "name": "FastShortcuts"
  },
  "publisher": {
    "@type": "Organization",
    "name": "FastShortcuts",
    "logo": {
      "@type": "ImageObject",
      "url": "https://fastshortcuts.com/logo.png"
    }
  },
  "datePublished": "2024-11-29",
  "dateModified": "2025-11-29",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://fastshortcuts.com/shortcuts/mac/"
  },
  "keywords": "macOS shortcuts, Mac shortcuts, keyboard shortcuts, productivity",
  "articleSection": "Operating Systems",
  "about": {
    "@type": "SoftwareApplication",
    "name": "macOS",
    "operatingSystem": "macOS",
    "applicationCategory": "OperatingSystem"
  }
}
</script>
```

## Template for IntelliJ Shortcuts Page

```html
<!-- Add before </head> tag in shortcuts/intellij/index.html -->

<!-- Breadcrumb Schema (JSON-LD) -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://fastshortcuts.com"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Shortcuts",
      "item": "https://fastshortcuts.com/#categories"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "IntelliJ IDEA Shortcuts",
      "item": "https://fastshortcuts.com/shortcuts/intellij/"
    }
  ]
}
</script>

<!-- TechArticle Schema -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "TechArticle",
  "headline": "IntelliJ IDEA Keyboard Shortcuts 2025 - Complete Guide",
  "description": "Boost productivity in IntelliJ IDEA with powerful keyboard shortcuts.",
  "author": {
    "@type": "Organization",
    "name": "FastShortcuts"
  },
  "publisher": {
    "@type": "Organization",
    "name": "FastShortcuts",
    "logo": {
      "@type": "ImageObject",
      "url": "https://fastshortcuts.com/logo.png"
    }
  },
  "datePublished": "2024-11-29",
  "dateModified": "2025-11-29",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://fastshortcuts.com/shortcuts/intellij/"
  },
  "keywords": "IntelliJ shortcuts, IntelliJ IDEA, keyboard shortcuts, developer productivity",
  "articleSection": "Developer Tools",
  "about": {
    "@type": "SoftwareApplication",
    "name": "IntelliJ IDEA",
    "operatingSystem": "Windows, macOS, Linux",
    "applicationCategory": "DeveloperApplication"
  }
}
</script>
```

## Template for Chrome Shortcuts Page

```html
<!-- Add before </head> tag in shortcuts/chrome/index.html -->

<!-- Breadcrumb Schema (JSON-LD) -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://fastshortcuts.com"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Shortcuts",
      "item": "https://fastshortcuts.com/#categories"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "Chrome Shortcuts",
      "item": "https://fastshortcuts.com/shortcuts/chrome/"
    }
  ]
}
</script>

<!-- TechArticle Schema -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "TechArticle",
  "headline": "Google Chrome Keyboard Shortcuts 2025 - Complete Guide",
  "description": "Browse faster with Chrome keyboard shortcuts. Essential shortcuts for power users.",
  "author": {
    "@type": "Organization",
    "name": "FastShortcuts"
  },
  "publisher": {
    "@type": "Organization",
    "name": "FastShortcuts",
    "logo": {
      "@type": "ImageObject",
      "url": "https://fastshortcuts.com/logo.png"
    }
  },
  "datePublished": "2024-11-29",
  "dateModified": "2025-11-29",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://fastshortcuts.com/shortcuts/chrome/"
  },
  "keywords": "Chrome shortcuts, Google Chrome, keyboard shortcuts, browser productivity",
  "articleSection": "Web Browsers",
  "about": {
    "@type": "SoftwareApplication",
    "name": "Google Chrome",
    "operatingSystem": "Windows, macOS, Linux",
    "applicationCategory": "WebBrowser"
  }
}
</script>
```

## Template for Sublime Shortcuts Page

```html
<!-- Add before </head> tag in shortcuts/sublime/index.html -->

<!-- Breadcrumb Schema (JSON-LD) -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "BreadcrumbList",
  "itemListElement": [
    {
      "@type": "ListItem",
      "position": 1,
      "name": "Home",
      "item": "https://fastshortcuts.com"
    },
    {
      "@type": "ListItem",
      "position": 2,
      "name": "Shortcuts",
      "item": "https://fastshortcuts.com/#categories"
    },
    {
      "@type": "ListItem",
      "position": 3,
      "name": "Sublime Text Shortcuts",
      "item": "https://fastshortcuts.com/shortcuts/sublime/"
    }
  ]
}
</script>

<!-- TechArticle Schema -->
<script type="application/ld+json">
{
  "@context": "https://schema.org",
  "@type": "TechArticle",
  "headline": "Sublime Text Keyboard Shortcuts 2025 - Complete Guide",
  "description": "Supercharge your text editing workflow with Sublime Text keyboard shortcuts.",
  "author": {
    "@type": "Organization",
    "name": "FastShortcuts"
  },
  "publisher": {
    "@type": "Organization",
    "name": "FastShortcuts",
    "logo": {
      "@type": "ImageObject",
      "url": "https://fastshortcuts.com/logo.png"
    }
  },
  "datePublished": "2024-11-29",
  "dateModified": "2025-11-29",
  "mainEntityOfPage": {
    "@type": "WebPage",
    "@id": "https://fastshortcuts.com/shortcuts/sublime/"
  },
  "keywords": "Sublime Text shortcuts, text editor, keyboard shortcuts, developer productivity",
  "articleSection": "Developer Tools",
  "about": {
    "@type": "SoftwareApplication",
    "name": "Sublime Text",
    "operatingSystem": "Windows, macOS, Linux",
    "applicationCategory": "DeveloperApplication"
  }
}
</script>
```

---

## How to Apply These Templates

1. Open each shortcut page file
2. Find the `</head>` tag
3. Insert the appropriate schema code BEFORE the `</head>` tag
4. Save the file

## Benefits of This Schema Markup

✅ **Rich Snippets:** Enhanced search results with breadcrumbs  
✅ **Better Indexing:** Search engines understand page hierarchy  
✅ **Article Cards:** Potential for article-style rich results  
✅ **Knowledge Graph:** Helps Google understand relationships between pages  
✅ **Voice Search:** Structured data improves voice search results  

## Testing Schema Markup

After deploying, test your schema markup at:
- **Google Rich Results Test:** https://search.google.com/test/rich-results
- **Schema Markup Validator:** https://validator.schema.org/

---

**Note:** The logo URL (`https://fastshortcuts.com/logo.png`) is a placeholder.  
You'll need to create and upload an actual logo image for full schema compliance.
