<script>


    // load constants
    import { SUBDIRECTORY } from '../../../constants.json';

</script>


<div id="boosting-principles-container" class="container">
    <div class="boosting-principles">
        <img alt="step #1" src="{SUBDIRECTORY}assets/images/creation.png">
        <h1>Step #1</h1>
        <p>Creation of exemplar multimedia content</p>
    </div>
    <div class="boosting-principles">
        <img alt="step #2" src="{SUBDIRECTORY}assets/images/publish.png">
        <h1>Step #2</h1>
        <p>Publish on pages you administer</p>
    </div>
    <div class="boosting-principles">
        <img alt="step #3" src="{SUBDIRECTORY}assets/images/share.png">
        <h1>Step #3</h1>
        <p>Share through influencers, public and private groups</p>
    </div>
    <div class="vl"></div>
    <div class="boosting-principles">
        <img alt="step #4" src="{SUBDIRECTORY}assets/images/boost.png">
        <h1>Step #4</h1>
        <p>Boost content</p>
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

    .boosting-principles{
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

    .boosting-principles h1{
        font-weight: var(--font-weight-bold);
        font-size: var(--font-size-very-small);
        margin: 0px;
        padding: 0px;
        margin-top: 8px;
        color: var(--white);
    }

    .boosting-principles p{
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
    
    .vl {
        margin: 32px 0px;
        border-width: 0px;
        border-left: 3px solid var(--white);
        opacity: 0.9;
    }

</style>