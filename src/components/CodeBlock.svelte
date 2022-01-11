<script>

    // properties
    export let editor = null;
    export let caption;
    export let options = {};

    // load libs
    import { onMount } from 'svelte'
    import CodeMirror from 'codemirror';

    // init variables
    let element;
    
    function createEditor(options) {
        if (editor) element.innerHTML = '';
        editor = CodeMirror(element, options);
    }

    onMount(() => {
        createEditor(options);
	})

</script>


<div class="container">
    <div bind:this={element}/>
</div>
<div class="caption-container">
    <p class="caption">{@html caption}</p>
</div>

<style>

    .caption-container{
        text-align: center;
        margin: auto;
    }

    .caption {
        font-size: var(--font-size-very-very-small);
        text-decoration: underline;
    }

    .container {
        padding: 16px 0px;
        margin: 0px;
        border-width: 0px;
    }

    /* BASICS */
    :global(.CodeMirror) {
        font-family: monospace;
        direction: ltr;
        color: var(--white);
        background: var(--black);
    }

    /* PADDING */
    :global(.CodeMirror-lines) {
        padding: 4px 0; /* Vertical padding around content */
    }
    :global(.CodeMirror pre.CodeMirror-line, .CodeMirror pre.CodeMirror-line-like) {
        padding: 0 4px; /* Horizontal padding of content */
    }
    :global(.CodeMirror-scrollbar-filler, .CodeMirror-gutter-filler) {
        background-color: var(--black);
    }

    /* GUTTER */
    :global(.CodeMirror-gutters) {
        border-right: 1px solid var(--white);
        background-color: var(--black);
        white-space: nowrap;
    }
    :global(.CodeMirror-linenumber) {
        padding: 0 3px 0 5px;
        min-width: 20px;
        text-align: right;
        color: var(--white);
        white-space: nowrap;
    }
    :global(.CodeMirror-guttermarker) { color: var(--white); }
    :global(.CodeMirror-guttermarker-subtle) { color: var(--white); }

    /* CURSOR */
    :global(.CodeMirror-cursor) {
        border-left: 1px solid var(--white);
        border-right: none;
        width: 0;
    }
    @-moz-keyframes blink {
        0% {}
        50% { background-color: transparent; }
        100% {}
    }
    @-webkit-keyframes blink {
        0% {}
        50% { background-color: transparent; }
        100% {}
    }
    @keyframes blink {
        0% {}
        50% { background-color: transparent; }
        100% {}
    }

    /* The rest of this file contains styles related to the mechanics of
    the editor. You probably shouldn't touch them. */
    :global(.CodeMirror) {
        position: relative;
        overflow: hidden;
    }

    :global(.CodeMirror-scroll) {
        /* Things will break if this is overridden */
        /* 30px is the magic margin used to hide the element's real scrollbars */
        /* See overflow: hidden in .CodeMirror */
        margin-bottom: -30px; 
        margin-right: -30px;
        padding-bottom: 30px;
        height: 100%;
        outline: none; /* Prevent dragging from highlighting the element */
        position: relative;
    }
    :global(.CodeMirror-sizer) {
        position: relative;
        border-right: 30px solid transparent;
    }

    /* The fake, visible scrollbars. Used to force redraw during scrolling
    before actual scrolling happens, thus preventing shaking and
    flickering artifacts. */
    :global(.editor, .CodeMirror-vscrollbar, .CodeMirror-hscrollbar, .CodeMirror-scrollbar-filler, .CodeMirror-gutter-filler) {
        position: absolute;
        z-index: 6;
        display: none !important;
    }

    :global(.CodeMirror ::-webkit-scrollbar) {
        width: 8px;
        height: 8px;
    }

    :global(.CodeMirror ::-webkit-scrollbar-track) {
        background: var(--white);
        border-radius: 10px;
    }

    :global(.CodeMirror ::-webkit-scrollbar-thumb) {
        border-radius: 10px;
        background: var(--white);
    }

    :global(.CodeMirror-vscrollbar) {
        right: 0; top: 0;
        overflow-x: hidden;
        overflow-y: hidden;
    }
    :global(.CodeMirror-hscrollbar) {
        bottom: 0; left: 0;
        overflow-y: hidden;
        overflow-x: hidden;
        height: 8px;
    }
    :global(.CodeMirror-scrollbar-filler) {
        right: 0; bottom: 0;
    }
    :global(.CodeMirror-gutter-filler) {
        left: 0; bottom: 0;
    }

    :global(.CodeMirror-gutters) {
        position: absolute; left: 0; top: 0;
        min-height: 100%;
        z-index: 3;
    }
    :global(.CodeMirror-gutter) {
        white-space: normal;
        height: 100%;
        display: inline-block;
        vertical-align: top;
        margin-bottom: -30px;
    }
    :global(.CodeMirror-gutter-wrapper) {
        position: absolute;
        z-index: 4;
        background: none !important;
        border: none !important;
    }
    :global(.CodeMirror-gutter-background) {
        position: absolute;
        top: 0; bottom: 0;
        z-index: 4;
    }
    :global(.CodeMirror-gutter-elt) {
        position: absolute;
        cursor: default;
        z-index: 4;
    }
    :global(.CodeMirror-gutter-wrapper ::selection) { background-color: transparent }
    :global(.CodeMirror-gutter-wrapper ::-moz-selection) { background-color: transparent }

    :global(.CodeMirror-lines) {
        cursor: text;
        min-height: 1px; /* prevents collapsing before first draw */
    }
    :global(.CodeMirror pre.CodeMirror-line,
    .CodeMirror pre.CodeMirror-line-like) {
        /* Reset some styles that the rest of the page might have set */
        -moz-border-radius: 0; -webkit-border-radius: 0; border-radius: 0;
        border-width: 0;
        background: transparent;
        font-family: inherit;
        font-size: inherit;
        margin: 0;
        white-space: pre;
        word-wrap: normal;
        line-height: inherit;
        color: inherit;
        z-index: 2;
        position: relative;
        overflow: visible;
        -webkit-tap-highlight-color: transparent;
        -webkit-font-variant-ligatures: contextual;
        font-variant-ligatures: contextual;
    }
    :global(.CodeMirror-wrap pre.CodeMirror-line, .CodeMirror-wrap pre.CodeMirror-line-like) {
        word-wrap: break-word;
        white-space: pre-wrap;
        word-break: normal;
    }

    :global(.CodeMirror-linebackground) {
        position: absolute;
        left: 0; right: 0; top: 0; bottom: 0;
        z-index: 0;
    }

    :global(.CodeMirror-linewidget) {
        position: relative;
        z-index: 2;
        padding: 0.1px; /* Force widget margins to stay inside of the container */
    }

    :global(.CodeMirror-rtl pre) { direction: rtl; }

    :global(.CodeMirror-code) {
        outline: none;
    }

    /* Force content-box sizing for the elements where we expect it */
    :global(.CodeMirror-scroll,
    .CodeMirror-sizer,
    .CodeMirror-gutter,
    .CodeMirror-gutters,
    .CodeMirror-linenumber) {
        -moz-box-sizing: content-box;
        box-sizing: content-box;
    }

    :global(.CodeMirror-measure) {
        position: absolute;
        width: 100%;
        height: 0;
        overflow: hidden;
        visibility: hidden;
    }

    :global(.CodeMirror-cursor) {
        position: absolute;
        pointer-events: none;
    }
    :global(.CodeMirror-measure pre) { position: static; }

    :global(div.CodeMirror-cursors) {
        /* always show cursor */
        visibility: visible;
        position: relative;
        z-index: 3;
    }
    :global(div.CodeMirror-dragcursors) {
        visibility: visible;
    }

    :global(.CodeMirror-focused div.CodeMirror-cursors) {
        visibility: visible;
    }

    :global(.CodeMirror-focused .CodeMirror-selected) { background: var(--black-light); }
    :global(.CodeMirror-crosshair) { cursor: crosshair; }
    :global(.CodeMirror-line::selection, .CodeMirror-line > span::selection, .CodeMirror-line > span > span::selection) { background: var(--black-light); }
    :global(.CodeMirror-line::-moz-selection, .CodeMirror-line > span::-moz-selection, .CodeMirror-line > span > span::-moz-selection) { background: var(--black-light); }

    /* Used to force a border model for a node */
    :global(.cm-force-border) { padding-right: .1px; }

    @media print {
        /* Hide the cursor when printing */
        :global(.CodeMirror div.CodeMirror-cursors) {
            visibility: hidden;
        }
    }

    /* See issue #2901 */
    :global(.cm-tab-wrap-hack:after) { content: ''; }

    /* Help users use markselection to safely style text background */
    :global(span.CodeMirror-selectedtext) { background: none; }

</style>