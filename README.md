## To run the website in local
bundle install
bundle exec nanoc live

## Release notes conventions
1. Organize the release details by month and dates within a month.
2. The release details must be sorted in descending order with latest release always appearing on top.
3. Don't use <br> tag for line breaks. Use more spaces or blackslash for line breaks instead of <br> tag. Reference : https://docs.gitlab.com/ee/user/markdown.html#newlines
4. If you want a line-break in bulleted list, please use two trailing space followed by newline. See existing release notes for examples.

<br/>

## To add diagrams using mermaid
~~~
```mermaid
 // your mermaid code goes here...
```
~~~

<br/>

## Sidebar Navigation
To update the sidebar navigation please follow the below the approach and make the changes accordingly in the `nanoc.yaml` file.

**To add a simple link:**
```
- title: Menu title
  link: "Menu url"
```
<br/>

**To add dropdown menu:**
```
- dropdown_menu_title: Company
  dropdown_menu_items:
    - title: Menu title
      link: "Menu url"
```
<br/>

**To add sub menu:**
```
- submenu:
  - title: Customer Service
    link: "/functions/Customer-Success/customer-service/"
  - title: Product Delivery
    link: "/functions/Customer-Success/product-delivery/"
```
<br/>

**To add a subsection menu inside dropdown menu:**
```
- dropdown_menu_title: Company
  dropdown_menu_items:
    - title: Menu title
      link: "Menu url"
    - subsection:
      - heading: Distributors w/ BSE
      - title: Overview
        link: "/going-live/distributors-with-bse/"
      - title: BSE sign up
        link: "/going-live/signing-up-with-bse-starmf/"
    - title: Menu title
      link: "Menu url"
```

<br/>

## Custom tags
#### 1. Tabs

```
:Tabs

::TabTitle Tab one

:::TabContent

:::EndTabContent

::TabTitle Tab two

:::TabContent

tab content two

:::EndTabContent

:EndTabs 
```

