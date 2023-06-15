---
title: Embed pre-built UI
---

## Embed pre-built UI

White labelled applications and hosted workflows can be accessed directly via a URL or embedded into any application to run independently


> Ensure you have completed signup with FP as per [go live checklist](/going-live/checklist)


### 1. Direct URL

If your application does not allow inserting a script, you can use the direct URL

```

https://<tenant>.sandbox.fpapps.io/<workflow_name>

```

### 2. Script to embed pre-built UI

You can open the white labelled application or hosted workflow inside your web application using embedded FP Apps javascript library.

#### Importing the Library

Import embedded FP Apps library in your web application using the following script tag:

```html
<script src="https://sandbox.fpapps.io/embed/fpappsWrapper.js"></script>

```

This script tag should be included in the HTML file where you want to use the library. The script tag would give access to `Fpapps` entity.

#### Opening pre built UI in an iframe

Use the `Fpapps.open(src)` function, where `src` is the URL of the white labelled application or hosted workflow

```js
Fpapps.open(src);

```

You can call this function from a button or a link's click event.

```html
<button onclick="Fpapps.open('https://<tenant>.sandbox.fpapps.io/<workflow_name>')">
  Open a hosted workflow in an iframe
</button>

```

#### Example

Here's an HTML page that shows how to use the embedded KYC hosted workflow.

```html
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8" />
    <title>Embed a FP hosted workflow</title>
    <script src="https://sandbox.fpapps.io/embed/fpappsWrapper.js"></script>
  </head>
  <body>
    <button onclick="handleOpen('https://<tenant>.sandbox.fpapps.io/kyc/')">
     Open hosted workflow in an iframe
    </button>
    <script>
      function handleOpen(src) {
        Fpapps.open(src);
      }
    </script>
  </body>
</html>
```

