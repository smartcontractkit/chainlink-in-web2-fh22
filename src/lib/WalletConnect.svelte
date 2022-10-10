<script>
	import { ethers } from 'ethers';
	export let web3Props = { provider: null, signer: null, account: null, chainId: null };
	export let contractAddr = '';
	export let contractAbi = { abi };
	async function connectWallet() {
		let provider = new ethers.providers.Web3Provider(window.ethereum, 'any');
		await provider.send('eth_requestAccounts', []);
		const signer = provider.getSigner();
		const account = await signer.getAddress();
		const chainId = await signer.getChainId();
		const contract = new ethers.Contract(contractAddr, contractAbi.abi, signer);
		console.log(contract);
		web3Props = { signer, provider, chainId, account, contract };
	}
</script>

{#if !web3Props.account}
	<button class="btn" on:click={connectWallet}>Attach Wallet</button>
{/if}
