describe("Wymeditor Itegration", function() {
//   beforeEach(function() {
//
//   });

//   it("Does something", function(){
//      expect(Something).toEqual(something_else);
//   });

   it("is connected to a textarea", function(){
      expect($("textarea.wymeditor")).toBeTruthy();
   });
});
