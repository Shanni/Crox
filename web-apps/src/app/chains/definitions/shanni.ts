import { defineChain } from "viem";

export const shanniChain = defineChain({
    id: 123,
    name: 'Shanni Test',
    network: 'L1A',
    nativeCurrency: {
        decimals: 18,
        name: 'L1Shanni Token',
        symbol: 'L1Shanni',
    },
    rpcUrls: {
        default: {
            http: ['http://127.0.0.1:9650/ext/bc/L1A/rpc']
        },
    },
    // blockExplorers: {
    //     default: { name: 'Explorer', url: 'https://subnets-test.avax.network/echo' },
    // },
    // Custom variables
    iconUrl: "/chains/logo/173750.png",
    icm_registry: "0xF86Cb19Ad8405AEFa7d09C778215D2Cb6eBfB228"
});