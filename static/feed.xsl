<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:atom="http://www.w3.org/2005/Atom">
  <xsl:output method="html" encoding="utf-8" indent="yes" />
  <xsl:template match="/">
    <xsl:variable name="site_title" select="/atom:feed/atom:title" />
    <xsl:variable name="description" select="/atom:feed/atom:subtitle" />
    <html lang="en">
      <head>
        <title><xsl:value-of select="$site_title" /> - Feed</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <style>
          :root {
            --bg: #fff;
            --text: #2e2f30;
            --button-bg: rgba(200, 200, 200, .25);
            --button-bg-hover: rgba(200, 200, 200, .5);
            --font-stack: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Helvetica, Arial, sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol";
            --grid-radius: 12px;
            --button-radius: 16px;
            --transition-duration: .3s;
            --ease-bounce: cubic-bezier(.22, 1.07, .36, 1);
          }
          @media (prefers-color-scheme: dark) {
            :root {
              --bg: #000;
              --text: #eee;
            }
          }
          * { box-sizing: border-box; margin: 0; padding: 0; }
          body {
            font: 16px/1.6 var(--font-stack);
            background: var(--bg);
            color: var(--text);
            padding: 4rem 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
          }
          header {
            max-width: 600px;
            width: 100%;
            margin-bottom: 4rem;
            text-align: center;
          }
          .back-link-container {
            margin-bottom: 2rem;
          }
          .back-link {
            display: inline-block;
            text-decoration: none;
            color: inherit;
            font-weight: 600;
            font-size: 0.9rem;
            padding: 8px 20px;
            background: var(--button-bg);
            border-radius: var(--button-radius);
            transition: transform 0.2s var(--ease-bounce), background-color 0.2s;
            backdrop-filter: blur(10px);
          }
          .back-link:hover {
            background-color: var(--button-bg-hover);
            transform: scale(1.05);
          }
          h1 {
            font-size: 2.5rem;
            font-weight: 900;
            margin-bottom: 0.5rem;
            letter-spacing: -0.02em;
          }
          .subtitle {
            font-size: 1.1rem;
            opacity: 0.6;
            margin-bottom: 2.5rem;
          }
          .feed-notice {
            background: var(--button-bg);
            padding: 1.5rem;
            border-radius: var(--button-radius);
            font-size: 0.95rem;
            line-height: 1.5;
            max-width: 500px;
            margin: 0 auto;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(128, 128, 128, 0.1);
          }
          .feed-notice strong { display: block; margin-bottom: 0.5rem; color: var(--text); }
          
          main {
            max-width: 600px;
            width: 100%;
            margin-top: 2rem;
          }
          .entry-list {
            list-style: none;
          }
          .entry-item {
            padding: 1.5rem 0;
            border-bottom: 1px solid rgba(128, 128, 128, 0.1);
            animation: fade-in 0.6s var(--ease-bounce) both;
            display: flex;
            justify-content: space-between;
            align-items: baseline;
            gap: 20px;
          }
          .entry-item:last-child { border-bottom: none; }
          
          .entry-title {
            font-size: 1.2rem;
            font-weight: 700;
            color: inherit;
            text-decoration: none;
            transition: opacity 0.2s;
          }
          .entry-title:hover { opacity: 0.6; }
          
          .entry-date {
            font-size: 0.85rem;
            font-weight: 500;
            opacity: 0.4;
            white-space: nowrap;
          }
          
          @keyframes fade-in {
            from { opacity: 0; transform: translateY(10px); }
            to { opacity: 1; transform: translateY(0); }
          }
          
          @media (max-width: 640px) {
            body { padding: 2rem 1rem; }
            h1 { font-size: 2rem; }
            .entry-item { flex-direction: column; gap: 4px; padding: 1.2rem 0; }
          }
        </style>
      </head>
      <body>
        <div class="back-link-container">
          <a href="/" class="back-link">← Back to Gallery</a>
        </div>
        <header>
          <h1><xsl:value-of select="$site_title" /></h1>
          <p class="subtitle"><xsl:value-of select="$description" /></p>
          <div class="feed-notice">
            <strong>Subscribe to this feed</strong>
            To follow these updates, copy the URL of this page and paste it into your favorite RSS/Atom feed reader.
          </div>
        </header>
        <main>
          <ul class="entry-list">
            <xsl:for-each select="/atom:feed/atom:entry">
              <li class="entry-item" style="animation-delay: {position() * 0.05}s">
                <a href="{atom:link/@href}" class="entry-title">
                  <xsl:value-of select="atom:title" />
                </a>
                <span class="entry-date">
                  <xsl:value-of select="substring(atom:published, 1, 10)" />
                </span>
              </li>
            </xsl:for-each>
          </ul>
        </main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
