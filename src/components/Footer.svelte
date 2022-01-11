<script>

    // properties
    export let lang;

    // load constants
    import { SUBDIRECTORY } from '../constants.json';

    // load libs
    import { getString } from '../libs/translator.js';

</script>


<div class="footer-up">
    <hr>
    <p class="italic" style="margin-top: 8px; margin-bottom: 8px;">{@html getString(lang, 'footer')}</p>
    <p style="margin-bottom: 8px;"><a href='{SUBDIRECTORY}assets/files/pgp.pub.txt' target='_blank'>PGP Public Key</a></p>
</div>


<style>

    div {
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        width: 100%;
        height: var(--footer-height);
        text-align: center;
        margin: 0px auto;
        padding: 0px;
        background-color: var(--black);
        z-index: 999;
    }

    hr {
        max-width: 100%;
        margin: 0px auto;
        padding: 0px;
        border-width: 0px;
        opacity: 1.0;
        border-bottom: 1px solid var(--white);
    }

    p {
        margin: 0px 0px 0px;
        padding: 0px;
        font-size: var(--font-size-very-small);
        font-weight: var(--font-weight-light);
    }


</style>