<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:media="http://search.yahoo.com/mrss/"
  xmlns:content="http://purl.org/rss/1.0/modules/content/">

  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/rss/channel">
    <html lang="en">
      <head>
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1"/>
        <title><xsl:value-of select="title"/> RSS Feed</title>
        <style>
          :root {
            --paper: #fbfaf7;
            --paper-soft: #eef2ee;
            --card: #fffefa;
            --ink: #18343f;
            --muted: #5f7077;
            --accent: #144e58;
            --border: #d8ded8;
          }
          * { box-sizing: border-box; }
          body {
            margin: 0;
            background: linear-gradient(180deg, var(--paper), var(--paper-soft));
            color: var(--ink);
            font-family: "Source Sans Pro", "Segoe UI", Helvetica, Arial, sans-serif;
            line-height: 1.65;
          }
          main {
            width: min(920px, calc(100vw - 2rem));
            margin: 0 auto;
            padding: 3rem 0 4rem;
          }
          h1, h2 {
            font-family: "Iowan Old Style", "Palatino Linotype", Georgia, serif;
            line-height: 1.1;
          }
          h1 {
            margin: 0 0 0.75rem;
            font-size: clamp(2.2rem, 5vw, 4rem);
          }
          .intro {
            margin: 0 0 1.5rem;
            max-width: 44rem;
            color: var(--muted);
            font-size: 1.08rem;
          }
          .actions {
            display: flex;
            flex-wrap: wrap;
            gap: 0.75rem;
            margin: 1.5rem 0 2.25rem;
          }
          a {
            color: var(--accent);
            font-weight: 700;
          }
          .button {
            display: inline-block;
            padding: 0.65rem 0.85rem;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 0.55rem;
            text-decoration: none;
          }
          .feed-url {
            padding: 0.75rem 0.9rem;
            overflow-wrap: anywhere;
            background: rgba(255, 254, 250, 0.78);
            border: 1px solid var(--border);
            border-radius: 0.55rem;
            color: var(--muted);
            font-family: ui-monospace, SFMono-Regular, Menlo, Consolas, monospace;
            font-size: 0.92rem;
          }
          article {
            margin: 1rem 0;
            padding: 1rem 1.1rem;
            background: var(--card);
            border: 1px solid var(--border);
            border-radius: 0.75rem;
            box-shadow: 0 12px 28px rgba(24, 52, 63, 0.07);
          }
          article h2 {
            margin: 0 0 0.35rem;
            font-size: 1.35rem;
          }
          .meta {
            margin: 0 0 0.75rem;
            color: var(--muted);
            font-size: 0.94rem;
          }
          .description {
            max-height: 12rem;
            overflow: hidden;
            color: var(--ink);
          }
        </style>
      </head>
      <body>
        <main>
          <h1><xsl:value-of select="title"/></h1>
          <p class="intro">
            This is the RSS feed for Jeffrey S. Racine's personal blog.
            Add this feed URL to your preferred RSS reader to receive new posts.
          </p>
          <p class="feed-url"><xsl:value-of select="atom:link[@rel='self']/@href"/></p>
          <div class="actions">
            <a class="button" href="https://jeffreyracine.github.io/blog/">Return to the blog</a>
            <a class="button" href="https://feedly.com/i/subscription/feed/{atom:link[@rel='self']/@href}">Subscribe with Feedly</a>
          </div>

          <xsl:for-each select="item">
            <article>
              <h2><a href="{link}"><xsl:value-of select="title"/></a></h2>
              <p class="meta">
                <xsl:value-of select="dc:creator"/>
                <xsl:if test="pubDate">
                  <xsl:text> · </xsl:text><xsl:value-of select="pubDate"/>
                </xsl:if>
              </p>
              <div class="description">
                <xsl:value-of select="description" disable-output-escaping="yes"/>
              </div>
            </article>
          </xsl:for-each>
        </main>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
