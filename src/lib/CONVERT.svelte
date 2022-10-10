<script>
	import { getETHPrice } from '../utils/getETHPrice';
	let value = 0;
	let price = 0;
	let calcValue = 0;
	$: ETH = 0;
	$: isValidCurrency = validateUSD(value);

	async function convertPrice(val) {
		ETH = await getETHPrice();
		price = val / ETH;
		calcValue = val;
	}

	function validateUSD(val) {
		const regex = /^\d*\.?\d{0,2}$/;
		return regex.test(val);
	}
</script>

<div class="card w-96 bg-base-100 shadow-xl text-center place-items-center p-4">
	<h1 class="text-3xl font-bold underline text-center pb-3">Convert USD To ETH</h1>
	<form class="w-full max-w-sm">
		<div class="md:flex md:items-center mb-6 place-items-center">
			<div class="md:w-1/6" />
			<label
				class="block text-gray-500 font-bold md:text-right mb-1 md:mb-0 pr-4"
				for="inline-full-name"
			>
				$:
			</label>
			<div class="md:w-2/3">
				<input
					type="text"
					placeholder="Insert Value"
					class="input input-bordered input-primary max-w-xs place text-right"
					bind:value
				/>
			</div>
		</div>
	</form>
	<button class="btn" disabled={!isValidCurrency} on:click={() => convertPrice(value)}
		>Convert</button
	>
	{#if ETH > 0}
		<h1 class="text-3xl font-bold underline">ETH Price</h1>
		<h1 class="text-3xl font-bold ">{ETH}</h1>
		<h2 class="text-2xl font-bold underline">Value of ${calcValue} in ETH</h2>
		<h2 class="text-2xl">{price} ETH</h2>
	{/if}
</div>
