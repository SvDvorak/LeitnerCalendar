<template>
    <p>Today you should review groups <b>{{ groups }}</b> (in that order).</p>
</template>

<script lang="ts">
import { Vue, Component, Prop } from "vue-property-decorator";
import * as moment from "moment";

@Component
export default class ReviewGroups extends Vue {
    @Prop() startDate!: Date;

    get groups(): string {
        let startDate = moment(this.startDate).startOf('day');
        let daysSinceStart = Math.max(moment().startOf('day').diff(startDate, 'days'), 0);

        let calendar = [
            [2,1],	[3,1],	[2,1],	[4,1], [2,1],	[3,1],	[2,1],	[1], 
            [2,1],	[3,1],	[2,1],	[5,1], [4,2,1],	[3,1],	[2,1],	[1], 
            [2,1],	[3,1],	[2,1],	[4,1], [2,1],	[3,1],	[2,1],	[6,1], 
            [2,1],	[3,1],	[2,1],	[5,1], [4,2,1],	[3,1],	[2,1],	[1],
            [2,1],	[3,1],	[2,1],	[4,1], [2,1],	[3,1],	[2,1],	[1], 
            [2,1],	[3,1],	[2,1],	[5,1], [4,2,1],	[3,1],	[2,1],	[1],
            [2,1],	[3,1],	[2,1],	[4,1], [2,1],	[3,1],	[2,1],	[7,1], 
            [2,1],	[3,1],	[6,2,1],[5,1], [4,2,1],	[3,1],	[2,1],	[1], 
        ];

        return calendar[daysSinceStart % calendar.length].join(', ');
    }
}
</script>