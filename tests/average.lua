describe('average', function()
  it('errors when its parent errors', function()
    expect(Rx.Observable.throw():average().subscribe).to.fail()
  end)

  it('produces a single value representing the average of the values produced by the source', function()
    expect(Rx.Observable.fromRange(3, 9, 2):average()).to.produce(6)
    expect(Rx.Observable.fromTable({-1, 0, 1}):average()).to.produce(0)
  end)

  it('produces nothing if there are no values to average', function()
    expect(Rx.Observable.empty():average()).to.produce.nothing()
  end)
end)
