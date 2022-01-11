<script>


    // load constants
    import { SUBDIRECTORY } from '../../../constants.json';

</script>


<div id="campaign-principles-container" class="container">
    <div class="campaign-principles">
        <img alt="credibility" src="{SUBDIRECTORY}assets/images/credibility.png">
        <h1>Credibility</h1>
        <p>Source, Vehicle, Production</p>
    </div>
    <div class="campaign-principles">
        <img alt="shareability" src="{SUBDIRECTORY}assets/images/shareability.png">
        <h1>Shareability</h1>
        <p>Network feels compelled to share the content</p>
    </div>
    <div class="campaign-principles">
        <img alt="targeted" src="{SUBDIRECTORY}assets/images/targeted.png">
        <h1>Targeted</h1>
        <p>Geography, Narrative, Vernacular, Platform</p>
    </div>
    <div class="campaign-principles">
        <img alt="repetition" src="{SUBDIRECTORY}assets/images/repetition.png">
        <h1>Repetition</h1>
        <p>Re-post to reach all potential users</p>
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

    .campaign-principles{
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

    .campaign-principles h1{
        font-weight: var(--font-weight-bold);
        font-size: var(--font-size-very-small);
        margin: 0px;
        padding: 0px;
        margin-top: 8px;
        color: var(--white);
    }

    .campaign-principles p{
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