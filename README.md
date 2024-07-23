# Spencer Podcast Generator

A GitHub Action to generate a podcast feed from a YAML file. YAML is much easier to read and write than XML, and this action will convert your YAML file into a valid podcast feed.

## Usage

### 1. Turn on GitHub Pages

1. In your repository, go to **Settings > Pages**.
2. Select the **main** branch as the source.
3. This will create a link to your page and give all of the content in the main branch a URL. Note the URL for the next step.

### 2. Create a YAML file

Create a YAML file in your repository with the following format:

```yaml
title: <Podcast Title>
subtitle: <Podcast Subtitle>
author: <Author Name>
description: <Podcast Description>
image: <Image URL>
language: <Language Code>
category: <Podcast Category>
format: <Audio Format>
link: <Podcast Link>
item:
  - title: <Episode Title>
    description: <Episode Description>
    enclosure: <Audio File URL>
    guid: <Unique ID>
    pubDate: <Publication Date>
```

## 3. Sample Workflow

Create a workflow file in your repository with the following content:

```yaml
name: Generate Podcast Feed
on: [push]
jobs:
  generate-feed:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Repo
        uses: actions/checkout@v3
      - name: Setup Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.10'
      - name: Install Dependencies
        run: |
          python -m pip install --upgrade pip
          pip install pyyaml
      - name: Run Feed Generator
        run: python feed.py
      - name: Push Repo
        run: |
          git config user.name github-actions
          git config user.email your-email@example.com
          git add .
          git commit -m "Generate Podcast Feed"
          git push
```

## Example YAML File
Here's an example of what your YAML file might look like:
``` yaml
  title: My Awesome Podcast
  subtitle: The Best Podcast in the World
  author: John Doe
  description: This is a podcast about awesome things.
  image: https://example.com/podcast.jpg
  language: en
  category: Technology
  format: audio/mpeg
  link: https://example.com
  item:
    - title: Episode 1
      description: This is the first episode.
      enclosure: https://example.com/episode1.mp3
      guid: episode1
      pubDate: Wed, 21 Oct 2020 07:00:00 GMT
    - title: Episode 2
      description: This is the second episode.
      enclosure: https://example.com/episode2.mp3
      guid: episode2
      pubDate: Wed, 28 Oct 2020 07:00:00 GMT
```
## Notes

- Ensure you have the correct URL for your GitHub Pages site.
- Replace `your-email@example.com` with your actual email in the workflow file.
- By following these steps, you will be able to automatically generate a podcast feed from a YAML file and publish it using GitHub Pages.

  
  
  
