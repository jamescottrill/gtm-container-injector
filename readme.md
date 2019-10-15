# Google Tag Manager Container Injector

A GTM custom template to inject additional GTM containers onto a page.
___
## Why would you want this?

Simply put, GDPR. The bane of every analytics professional, other than ITP, obviously. Now we have to provide a mechanism where users can opt in to receiving cookies and other device storage.

There are companies that allow you to poll your site visitors, and then store their preferences in a cookie (ironic, I know), but this on its own doesn't do anything, you still have to link your marketing tags up to the cookie consent platform. This is where the different containers come in.
___
### 1. Split your tags up

Identify what category your different tags come under. The standard sections are:
  * Strictly Necessary
  * Performance
  * Marketing
  * Functional

How you choose to break your tags up, though, is entirely between you and your/your client's legal department.

### 2. Create a container for each cagegory and a master container.

Your master container will be the container that you load on each page. It's important that it doesn't contain any other tags, all it should have is your container injector tags. Migrate your tags from your existing containers to their new homes in the different category containers. Make sure you use sensible naming convention e.g. site_name - marketing (it won't affect the tag, but it's just good practice)

### 3. Create the logic

Cookie consent tools can work in one of two ways: All or Nothing OR Pick n Mix. To trigger the GTM containers to load, you will need:

  1. An event when a user accepts cookies.

   This will enable your marketing tags to fire on the first page. You don't need to worry about tags that fire off events that have already happened (Page Load, DOM Ready, Window Loaded or custom events), as long as you're using the same dataLayer these will all be processed when the container loads.

   Create a Custom Event variable that matches the event fired when someone accepts cookies. If this doesn't happen then you'll have to do some clever JavaScript to identify which of the cookie types a user has accepted and use a click trigger when they click the accept button.

  2. A Page Load event that reads the cookie consent cookie in the browser.

   This works for every subsequent page. Create a First Party Cookie variable for the cookie that your consent tool sets and decode the URI. Create a Page View event for every type of container you want to load and set the firing condition for your first party cookie containing the string that your cookie sets when the user has opted in.

   This string might be something like 'marketing:1' or 'ACCEPTED' or a random nubmer string '0_19232:1'. Just make sure that it identifies the opt-in version.

### 4. Test it out

Make sure that your consent tool is working. If you preview your master container you should see the container injector tags and when they fire. If you're previewing the child containers, the preview will also load once the contaienr is injected. If you click the dropdown menu on the top right of the preview where the container Ids are you'll see the containers.

When you opt in to cookies you should have an event that loads all the selected containers.

On every subsequent page, your containers should load on Page Load.




