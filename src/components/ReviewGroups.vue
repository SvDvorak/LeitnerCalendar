<template>
    <div>
        <p>Today you should review in order the following groups</p>
        <div class="groupNumbers">
            <div v-for="group in groups" :key="group.number" :value="group.number">
                <p :style="{ color: group.color }">{{ group.number }}</p>
                <p>{{ !isLast(group.number) ? ',' : '' }}&nbsp;</p>
            </div>
        </div>
    </div>
</template>

<script lang="ts">
import { Vue, Component, Prop } from "vue-property-decorator";
import * as moment from "moment";

export class Group {
    number : number = 0;
    colors: { [number: number]: string; } = { };

    constructor(number : number) {
        this.number = number;
        this.colors[1] = '#ff4d4d';
        this.colors[2] = '#f5925e';
        this.colors[3] = '#ffe142';
        this.colors[4] = '#95cd69';
        this.colors[5] = '#35a8d9';
        this.colors[6] = '#8560a0';
        this.colors[7] = '#f272a7';
    }

    get color() : string {
        return this.colors[this.number];
    }

    isLast() : boolean {
        return this.number == 7;
    }
}

@Component
export default class ReviewGroups extends Vue {
    @Prop() startDate!: Date;

    calendar = [
        [2,1],	[3,1],	[2,1],	[4,1], [2,1],	[3,1],	[2,1],	[1], 
        [2,1],	[3,1],	[2,1],	[5,1], [4,2,1],	[3,1],	[2,1],	[1], 
        [2,1],	[3,1],	[2,1],	[4,1], [2,1],	[3,1],	[2,1],	[6,1], 
        [2,1],	[3,1],	[2,1],	[5,1], [4,2,1],	[3,1],	[2,1],	[1],
        [2,1],	[3,1],	[2,1],	[4,1], [2,1],	[3,1],	[2,1],	[1], 
        [2,1],	[3,1],	[2,1],	[5,1], [4,2,1],	[3,1],	[2,1],	[1],
        [2,1],	[3,1],	[2,1],	[4,1], [2,1],	[3,1],	[2,1],	[7,1], 
        [2,1],	[3,1],	[6,2,1],[5,1], [4,2,1],	[3,1],	[2,1],	[1], 
    ];

    get groups(): Group[] {
        let startDate = moment(this.startDate).startOf('day');
        let daysSinceStart = Math.max(moment().startOf('day').diff(startDate, 'days'), 0);


        return this.calendar[daysSinceStart % this.calendar.length].map(x => new Group(x));
    }

    isLast(groupNumber : number): boolean {
        var groups = this.groups;
        return groups.map(x => x.number).indexOf(groupNumber) == groups.length - 1;
    }
}
</script>

<style>
.groupNumbers {
    display: flex;
    flex-direction: row;
    justify-content: center;
}

.groupNumbers div {
    display: flex;
    flex-direction: row;
}

.groupNumbers p {
    font-size: 3em;
    margin: 0.3em 0em;
}
</style>