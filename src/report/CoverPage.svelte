<script>

    // properties
    export let lang;
    export let scrollTop = 0;

    // load constants
    import { SUBDIRECTORY } from '../constants.json';

</script>


<!-- First thing we see is the image taking up the full screen -->
<div id="top-img-container" style="top: {-scrollTop}px">
    <img alt="hate speech" src="{SUBDIRECTORY}assets/images/hate_speech.jpg" />
    <p>by Cara Zwibel & Evan Balgord</p>
</div>


<style>

    #top-img-container {
        position: absolute;
        top: 32px;
        border: 0px;
        z-index: -2;
        height: 100vh;
        text-align: left;
    }

    #top-img-container img {
        height: 100%;
        width: auto;
        opacity: 0.85;
        border-bottom: 2px solid var(--white);
        border-right: 2px solid var(--white);
    }

    #top-img-container p {
        margin: 0px 8px;
        font-size: var(--font-size-very-very-small);
    }

    /* styles for browsers smaller than 600px; */
    @media (max-width : 599px) {
        #top-img-container {
            right: 0px;
            text-align: right;
        }
    }
    @media (min-width : 599px) {
        #top-img-container {
            left: 0px;
            text-align: left;
        }
    }

</style>