describe('contains', function()
  it('errors when its parent errors', function()
    expect(Rx.Observable.throw():contains(1).subscribe).to.fail()
  end)

  it('returns false if the source Observable produces no values', function()
    expect(Rx.Observable.empty():contains(3)).to.produce(false)
  end)

  it('returns true if the value is nil and the Observable produces an empty value', function()
    local observable = Rx.Observable.create(function(observer)
      observer:onNext(nil)
      observer:onCompleted()
    end)

    expect(observable:contains(nil)).to.produce(true)
  end)

  it('returns true if the source Observable produces the specified value', function()
    local observable = Rx.Observable.fromRange(5)
    expect(observable:contains(3)).to.produce(true)
  end)

  it('supports multiple values', function()
    local observable = Rx.Observable.fromRange(6):wrap(3)
    expect(observable).to.produce({{1, 2, 3}, {4, 5, 6}})
    expect(observable:contains(5)).to.produce(true)
  end)
end)
