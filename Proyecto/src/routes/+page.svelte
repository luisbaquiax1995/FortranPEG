<script lang="ts">
    import parseInput from "$lib/parser";
    import CodeMirror from "svelte-codemirror-editor";


    let editorText = $state("");
    let result = $state("");
    let errorLine = $state<number | null>(null);

    function parse() {
        const parseResult = parseInput(editorText.trim());
        if (typeof parseResult === "string" && parseResult.startsWith("Error")) {
            const match = parseResult.match(/línea (\d+), columna (\d+)/i);
            if (match) {
                errorLine = parseInt(match[1], 10) ;
            }
        } else {
            errorLine = null;
        }
        result = parseResult;
    }

</script>

<h1 class="text-2xl text-center font-bold mb-4">Analizador de Gramaticas PEG</h1>
<div class="flex h-full divide-x divide-gray-300">
    
    <div class="w-1/2 p-4">
        <h2 class="text-lg font-bold mb-2">Editor</h2>
        <div class="rounded-md border border-gray-300 shadow-md relative h-full overflow-auto">
            <CodeMirror 
                bind:value={editorText} 
                on:change={parse} 
            />
            {#if errorLine !== null}
            <div
                class="absolute top-0 left-0 w-full h-full pointer-events-none"
                style="background-color: rgba(255, 0, 0, 0.1);"
                class:error-line={errorLine !== null}
            ></div>
        {/if}
        </div>
    </div>

    <div class="w-1/2 p-4">
        <h2 class="text-lg font-bold mb-2">Resultados</h2>
        <div class="rounded-md border-2 border-gray-300 shadow-md p-4 bg-gray-50 h-full">
            {#if typeof result === "string" && result.startsWith("Error")}
                <p class="text-red-500 font-semibold">
                    {result}
                </p>
            {:else}
                <p class="text-green-600 font-semibold">
                    {result}
                </p>
            {/if}
        </div>
    </div>
</div>

<style>
    .error-line {
        background-color: rgba(255, 0, 0, 0.1);
    }
</style>