<script>
	import WalletConnect from './WalletConnect.svelte';
	import VRF from '../contract/VRF.json';
	import { ethers } from 'ethers';
	export let web3Props = {
		provider: null,
		signer: null,
		account: null,
		chainId: null,
		contract: null
	};
	const contractAddr = '0x88477433736d6f4bbAFcbD9E88423fDe09Ce7490';
	$: randomNum = 0;
	const randomNumberListner = async () => {
		const url = 'https://api.avax-test.network/ext/bc/C/rpc';
		var provider = new ethers.providers.JsonRpcProvider(url);
		const vrfCon = new ethers.Contract(contractAddr, VRF.abi, provider);
		vrfCon.on('RequestFulfilled', async (_, randomWords) => {
			randomNum = randomWords[0];
		});
	};
	randomNumberListner();
</script>

<div class="card w-96 bg-base-100 shadow-xl text-center place-items-center p-4">
	{#if !web3Props.account && !web3Props.contract}
		<WalletConnect bind:web3Props {contractAddr} contractAbi={VRF} />
	{:else}
		<h1 class="text-3xl font-bold underline text-center pb-3">
			<a href="https://testnet.snowtrace.io/address/0x88477433736d6f4bbAFcbD9E88423fDe09Ce7490"
				>Get A Random Number</a
			>
		</h1>
		<button class="btn" on:click={() => web3Props.contract.requestRandomWords()}
			>Get A Random Number</button
		>
		<h1 class="text-3xl font-bold underline">Random Number</h1>
		<div class="max-w-md p-2 mt-6 rounded-md grid grid-cols-1">
			<p class="flow-text break-words">{randomNum}</p>
		</div>
	{/if}
</div>
