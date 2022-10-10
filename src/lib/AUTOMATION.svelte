<script>
	import { ethers } from 'ethers';
	import AUTOMATION from '../contract/automation.json';

	let count = 0;
	const listenForEvent = async () => {
		const contractAddr = '0x3BcC66f059Ad445b49A2997DbA526faE44aE7e57';
		const url = 'https://api.avax-test.network/ext/bc/C/rpc';
		var provider = new ethers.providers.JsonRpcProvider(url);
		const automationCon = new ethers.Contract(contractAddr, AUTOMATION.abi, provider);
		let countTxn = await automationCon.num();
		console.log(countTxn);
		count = countTxn;
		automationCon.on('Counted', async (_count) => {
			count = _count;
		});
	};
	listenForEvent();
</script>

<div class="card w-96 bg-base-100 shadow-xl text-center place-items-center p-4">
	<h1 class="text-3xl font-bold underline text-center pb-3">Total Counted</h1>
	<div class="max-w-md p-2 mt-6 rounded-md grid grid-cols-1">
		<p class="text-xl flow-text break-words">{count}</p>
	</div>
</div>
