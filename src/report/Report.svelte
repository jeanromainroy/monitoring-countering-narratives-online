<script>

    // properties
    export let lang;

    // load constants
    import { ONION_ADDRESS, SUBDIRECTORY, 
            OF_INTEREST, MIN_NBR_OF_PUBLICATION_OF_INTEREST } from '../constants.json';

    // load libs
    import { onMount } from 'svelte';
    import { getString } from '../libs/translator.js';
    
    // load helper functions
    import { interleave, load_params, load_tools, load_findings, load_posts_zip } from './helper.js';

    // init variables
    let phase_1_params_done = false;
    let phase_2_brazil_done = false;
    let phase_3_lebanon_done = false;
    let phase_4_ivory_coast_done = false;

    // data
    let brazil_params, lebanon_params, ivory_coast_params;
    let sample_posts = null;
    let brazil_dataset, lebanon_dataset, ivory_coast_dataset;
    
    onMount(async () => {

        // load params
        brazil_params = await load_params('brazil');
        lebanon_params = await load_params('lebanon');
        ivory_coast_params = await load_params('ivory_coast');

        // combine example posts
        sample_posts = interleave(brazil_params['examples']['lexicon'], lebanon_params['examples']['lexicon'])
        sample_posts = interleave(sample_posts, ivory_coast_params['examples']['lexicon'])

        // set ready flag
        phase_1_params_done = true;

        // ------------------------------------------------------------------------------------------
        // -------------------------------------- Brazil --------------------------------------------
        // ------------------------------------------------------------------------------------------
        
        // load data
        const [ brazil_sources, brazil_lexicon, brazil_events ] = await load_tools('brazil');
        const [ brazil_submissions, brazil_dictionary, brazil_categories ] = await load_findings('brazil');
        const brazil_posts_zip = await load_posts_zip('brazil');

        // bundle the data
        const brazil_payload = {
            'sources': brazil_sources, 
            'posts_zipped': brazil_posts_zip, 
            'submissions': brazil_submissions, 
            'lexicon': brazil_lexicon, 
            'events': brazil_events, 
            'categories': brazil_categories, 
            'dictionary': brazil_dictionary,
            'OF_INTEREST': OF_INTEREST,
            'MIN_NBR_OF_PUBLICATION_OF_INTEREST': MIN_NBR_OF_PUBLICATION_OF_INTEREST
        };

        // init worker
        var worker_brazil = new Worker('assets/scripts/task_preproc.js', { type: "module" });

        // configure how the worker responds to incomming data
        worker_brazil.addEventListener('message', function(e) {
            brazil_dataset = e.data;
            phase_2_brazil_done = true;
        }, false); 

        // start worker
        worker_brazil.postMessage(brazil_payload);


        // ------------------------------------------------------------------------------------------
        // ------------------------------------- Lebanon --------------------------------------------
        // ------------------------------------------------------------------------------------------
        
        // // load data
        // const [ lebanon_sources, lebanon_lexicon, lebanon_events ] = await load_tools('lebanon');
        // const [ lebanon_submissions, lebanon_dictionary, lebanon_categories ] = await load_findings('lebanon');
        // const lebanon_posts_zip = await load_posts_zip('lebanon');

        // // bundle the data
        // const lebanon_payload = {
        //     'sources': lebanon_sources, 
        //     'posts_zipped': lebanon_posts_zip, 
        //     'submissions': lebanon_submissions, 
        //     'lexicon': lebanon_lexicon, 
        //     'events': lebanon_events, 
        //     'categories': lebanon_categories, 
        //     'dictionary': lebanon_dictionary,
        //     'OF_INTEREST': OF_INTEREST,
        //     'MIN_NBR_OF_PUBLICATION_OF_INTEREST': MIN_NBR_OF_PUBLICATION_OF_INTEREST
        // };

        // // init worker
        // var worker_brazil = new Worker('assets/scripts/task_preproc.js', { type: "module" });

        // // configure how the worker responds to incomming data
        // worker_brazil.addEventListener('message', function(e) {
        //     lebanon_dataset = e.data;
        //     phase_3_lebanon_done = true;
        // }, false); 

        // // start worker
        // worker_brazil.postMessage(lebanon_payload);


        // ------------------------------------------------------------------------------------------
        // ----------------------------------- Ivory Coast ------------------------------------------
        // ------------------------------------------------------------------------------------------
        
        // load data
        const [ ivory_coast_sources, ivory_coast_lexicon, ivory_coast_events ] = await load_tools('ivory_coast');

        // bundle the data
        ivory_coast_dataset = {
            'sources': ivory_coast_sources, 
            'lexicon': ivory_coast_lexicon, 
            'events': ivory_coast_events
        };

        // set ready flag
        phase_4_ivory_coast_done = true;
    })

    // import sections
    import Introduction from './sections/1-Introduction.svelte';
    import Framework from './sections/2-Framework.svelte';
    import Monitoring from './sections/3-Monitoring.svelte';
    import Countering from './sections/4-Countering.svelte';

    import Brazil from './sections/case_studies/Brazil.svelte';
    import Lebanon from './sections/case_studies/Lebanon.svelte';
    import IvoryCoast from './sections/case_studies/IvoryCoast.svelte';

</script>

<main>

    <!-- Title -->
    <div class="spacing-before-title"></div>

    <div class="top-title-container">
        <div class="vert-cell"></div>
        <div class="vert-cell">
            <p class="top-title">{getString(lang, 'title')}</p>
            <p class="top-subtitle">{getString(lang, `subtitle`)}</p>
        </div>
        <div class="vert-cell"></div>
        <div class="vert-cell"></div>
        <div class="vert-cell">
            <p>by</p>
            <p class="authors"><a href="https://jeanromainroy.com/" target="_blank">Jean-Romain Roy</a></p>
            <!-- <p class="authors"><a href="https://derekruths.com/" target="_blank">Dr. Derek Ruths</a></p> -->
        </div>
        <div class="vert-cell"></div>
        {#if ONION_ADDRESS.length > 0}
            <div class="vert-cell"></div>
            <div class="vert-cell">
                <p id="onion-location"><a href="{ONION_ADDRESS}{SUBDIRECTORY}" target="_blank">Tor Link</a></p>
            </div>
        {/if}
    </div>

    <div class="spacing-before-report"></div>

    <!-- Sections -->
    <div class="separator"></div>
    <Introduction bind:lang={lang}/>

    {#if phase_1_params_done}
        <div class="separator"></div>
        <Monitoring sample_posts={sample_posts} bind:lang={lang}/>
    {/if}

    <div class="separator"></div>
    <Countering bind:lang={lang}/>

    {#if phase_2_brazil_done}
        <div class="separator"></div>
        <Brazil lang={lang} params={brazil_params} dataset={brazil_dataset}/>
    {/if}

    {#if phase_3_lebanon_done}
        <div class="separator"></div>
        <Lebanon lang={lang} params={lebanon_params} dataset={lebanon_dataset}/>
    {/if}

    {#if phase_4_ivory_coast_done}
        <div class="separator"></div>
        <IvoryCoast lang={lang} params={ivory_coast_params} dataset={ivory_coast_dataset}/>
    {/if}

</main>


<style>

    .spacing-before-title {
        height: 30vh;
    }

    .spacing-before-report {
        height: 30vh;
    }

    .top-title-container {
        display: flex;
        flex-direction: column;
        overflow: hidden;
        margin: 0px auto;
        height: 40vh;
        padding: 8px 32px;
        max-width: var(--max-width-small);
        background-color: var(--black);
        border: 1px solid var(--white);
        align-items: center;
        justify-content: space-between;
    }

    #onion-location {
        font-size: var(--font-size-very-very-very-small);
    }

    .authors {
        font-size: var(--font-size-very-small);
    }

    .vert-cell{
        height: 100%;
    }

    .top-title {
        margin: 0px;
        padding: 0px;
        margin-bottom: 4px;
        font-weight: var(--font-weight-normal);
        font-size: var(--font-size-very-large);
    }

    .top-subtitle {
        margin: 0px;
        padding: 0px;
        font-weight: var(--font-weight-normal);
        font-size: var(--font-size-small);
    }

    /* styles for browsers smaller than 600px; */
    @media (max-width : 599px) {
        .spacing-before-title {
            height: 17vh;
        }
        .spacing-before-report {
            height: 17vh;
        }   
        .top-title-container {
            height: 66vh;
        }
        .top-title {
            font-size: var(--font-size-large);
        }
    }


    main {
        position: absolute;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        width: 100%;
        margin: 0px auto;
        padding: 0px;
        text-align: center;
        overflow-y: scroll;
        overflow-x: hidden;
        padding-bottom: 96px;
        z-index: 1;
    }

</style>