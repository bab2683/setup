# Jest essentials

### Mocking properties
```typescript
Object.defineProperty(window, 'location', {
   get: jest.fn().mockImplementation(() => {
     return {
       href: 'myurl/la/de/test'
     };
   }),
   set: jest.fn().mockImplementation(() => null)
});
```