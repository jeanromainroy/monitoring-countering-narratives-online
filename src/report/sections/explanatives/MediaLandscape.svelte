<script>

    // load constants
    import { SUBDIRECTORY } from '../../../constants.json';

</script>


<div id="media-landscape-container" class="container">
    <div class="media-landscape">
        <img alt="traditional media" src="{SUBDIRECTORY}assets/images/newspaper.png">
        <h1>Traditional Media</h1>
        <p>Newspapers</p>
        <p>Magazines</p>
        <p>Billboards</p>
        <p>Radio</p>
        <p>Broadcast TV</p>
        <p>Direct paper mail</p>
    </div>
    <div class="media-landscape">
        <img alt="digital media" src="{SUBDIRECTORY}assets/images/devices.png">
        <h1>Digital Media</h1>
        <p>Online advertising</p>
        <p>Search engines</p>
        <p>Social media</p>
        <p>Video streaming services</p>
        <p>Websites</p>
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

    .media-landscape{
        margin: 0px;
        padding: 32px;
        display: inline-block;
        align-items: center;
        text-align: center;
        max-width: 220px;
    }

    .media-landscape h1{
        font-weight: var(--font-weight-bold);
        font-size: var(--font-size-very-small);
        margin: 0px;
        padding: 0px;
        margin-top: 8px;
        color: var(--white);
    }

    .media-landscape p{
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
        width: auto;
        padding: 4px;
        margin: 0px;
        filter: brightness(0) invert(1);
        opacity: 0.9;
    }

</style>