<script>
	$: randomNum = 0;
	function getRandomValue() {
		randomNum = Math.floor(Math.random() * 100);
	}
</script>

<div class="card w-96 bg-base-100 shadow-xl text-center place-items-center p-4">
	<h1 class="text-3xl font-bold underline text-center pb-3">Get A Random Number</h1>
	<button class="btn" on:click={() => getRandomValue()}>Get A Random Number</button>
	<h1 class="text-3xl font-bold underline">Random Number</h1>
	<h1 class="text-3xl font-bold ">{randomNum}</h1>
</div>
