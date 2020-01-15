# Angular essentials

### Multiple `ng-template` viewRef
```typescript
@ViewChildren('test', { read: ViewContainerRef }) rows: QueryList<ViewContainerRef>;
```

```html
<ng-template ngFor let-seatrow let-i="index" [ngForOf]="seats" [ngForTrackBy]="trackRow">
    <ng-template #test></ng-template>
      ...
```