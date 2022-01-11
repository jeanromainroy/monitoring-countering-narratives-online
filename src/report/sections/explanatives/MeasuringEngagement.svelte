<script>

    // load constants
    import { SUBDIRECTORY } from '../../../constants.json';

</script>


<div id="measuring-engagement-container" class="container">
    <div class="measuring-engagement">
        <img alt="page views" src="{SUBDIRECTORY}assets/images/views.png">
        <h1>Views</h1>
        <p>Captures the IP address and browser information each time a visitor loads the page</p>
    </div>
    <div class="measuring-engagement">
        <img alt="scrolling" src="{SUBDIRECTORY}assets/images/scrolling.png">
        <h1>Scrolling</h1>
        <p>Captures the scroll distance and speed of each visitor</p>
    </div>
    <div class="measuring-engagement">
        <img alt="outbound clicks" src="{SUBDIRECTORY}assets/images/click.png">
        <h1>Outbound clicks</h1>
        <p>Captures an outbound click event each time a visitor clicks a link that leads them away from the page</p>
    </div>
    <div class="measuring-engagement">
        <img alt="video engagement" src="{SUBDIRECTORY}assets/images/video.png">
        <h1>Video engagement</h1>
        <p>Captures video play, progress, and complete events as visitors view embedded videos</p>
    </div>
    <div class="measuring-engagement">
        <img alt="downloads" src="{SUBDIRECTORY}assets/images/downloads.png">
        <h1>File Downloads</h1>
        <p>Captures a file download event each time a file link is clicked</p>
    </div>
    <div class="measuring-engagement">
        <img alt="site search" src="{SUBDIRECTORY}assets/images/search.png">
        <h1>Site search</h1>
        <p>Captures the query parameter each time a visitor performs a search on your site</p>
    </div>
</div>



<style>

    .container {
        text-align: center;
        margin: auto;
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        max-width: var(--max-width-large);
        padding: 0px;
    }

    .measuring-engagement{
        margin: 0px;
        padding-left: 32px;
        padding-right: 32px;
        padding-top: 16px;
        padding-bottom: 16px;
        display: inline-block;
        align-items: center;
        text-align: center;
        max-width: 150px;
    }

    .measuring-engagement h1{
        font-weight: var(--font-weight-bold);
        font-size: var(--font-size-very-small);
        margin: 0px;
        padding: 0px;
        color: var(--white);
    }

    .measuring-engagement p{
        font-weight: var(--font-weight-normal);
        font-size: var(--font-size-very-very-very-small);
        word-spacing: var(--word-spacing-small);
        margin: 0px;
        padding: 0px;
        line-height: var(--line-height-small);
        color: var(--white);
        background-color: var(--black-transparent);
        box-shadow: var(--black-box-shadow);
    }

    img {
        height: 80px;
        padding: 4px;
        margin: 0px;
        width: auto;
        filter: brightness(0) invert(1);
        opacity: 0.9;
    }

</style>