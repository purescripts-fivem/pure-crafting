import { useEffect, useMemo, useRef, useState } from 'react';
import { useAppSelector } from '../../store/store';
import Button from './Button';
import style from './index.module.css';
import { craftingItem } from '../../types/crafting';
import Item from './Item';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons';
import Blueprint from './Blueprint';
import { checkFave } from '../../utils/checkFave';

const Crafting = () => {
  const theme = useAppSelector((state) => state.config.theme);
  const crafting = useAppSelector((state) => state.crafting);
  const blueprints = crafting.blueprints;
  const categories = useAppSelector((state) => state.ui.categories);
  const faves = useAppSelector((state) => state.ui.faves);
  const [craftingItems, setCraftingItems] = useState<craftingItem[]>([]);
  const [search, setSearch] = useState('');
  const scrollRef = useRef<HTMLDivElement>(null);
  const [displayBlueprints, setDisplayBlueprints] = useState(false);

  const buttonClick = (category: string) => {
    sortItems(category);
  };

  const handleWheel = (evt: any) => {
    const delta = evt.deltaY;
    if (scrollRef.current) {
      scrollRef.current.scrollLeft += delta;
    }
  };

  const sortItems = (category: string) => {
    let array: craftingItem[] = [];
    if (category === 'all') {
      array = crafting.items;
      setCraftingItems(array);
      setDisplayBlueprints(true);
      return;
    }

    crafting.items.map((item: craftingItem) => {
      if (item.category === category) {
        array.push(item);
      }
    });

    if (category === 'fave') {
      setDisplayBlueprints(false);
    } else {
      setDisplayBlueprints(true);
    }

    setCraftingItems(array);
  };

  useEffect(() => {
    sortItems('all');
  }, [crafting.items]);

  useMemo(() => {
    sortItems('all');
  }, []);

  return (
    <div className={style.container}>
      <div className={style.top}>
        <Button
          icon='fa-list'
          onClick={() => {
            buttonClick('all');
          }}
        />
        <div className={style.categories} ref={scrollRef} onWheel={handleWheel}>
          {categories.length > 0 &&
            categories.map((item, index) => {
              return (
                <Button
                  key={index}
                  icon={item.icon}
                  onClick={() => {
                    buttonClick(item.category);
                  }}
                />
              );
            })}
        </div>
        <div
          className={style.search}
          style={{
            background: theme.main,
            border: `0.2vw solid ${theme.border}`,
          }}>
          <FontAwesomeIcon
            icon={faMagnifyingGlass}
            style={{
              color: theme.white,
              fontSize: '1.15vw',
              filter: 'drop-shadow(0 0 8px rgba(0, 0, 0, 0.5))',
            }}
          />
          <input
            type='text'
            className={style.input}
            style={{
              color: theme.white,
            }}
            onChange={(e) => {
              setSearch(e.target.value.toLowerCase());
            }}
            placeholder='Search...'
          />
        </div>
      </div>
      <div className={style.housing}>
        {craftingItems.length > 0 &&
          craftingItems
            .filter((item: craftingItem) => {
              return search === ''
                ? item
                : item.name.toLowerCase().includes(search);
            })
            .map((item: craftingItem, index: number) => {
              return (
                <Item
                  key={index}
                  name={item.name}
                  image={item.image}
                  isFave={checkFave(item.itemName, faves)}
                  id={item.id}
                  type={item.type === 'blueprint' ? 'blueprint' : 'item'}
                  selected={
                    crafting.currentItem
                      ? crafting.currentItem.id === item.id
                      : false
                  }
                />
              );
            })}
        {blueprints.length > 0 &&
          displayBlueprints &&
          blueprints
            .filter((item: craftingItem) => {
              return search === ''
                ? item
                : item.name.toLowerCase().includes(search);
            })
            .map((item: craftingItem, index: number) => {
              return (
                <Blueprint
                  key={index}
                  name={item.name}
                  image={item.image}
                  isFave={checkFave(item.itemName, faves)}
                  id={item.id}
                  type={'blaze'}
                  selected={
                    crafting.currentItem
                      ? crafting.currentItem.id === item.id
                      : false
                  }
                />
              );
            })}
      </div>
    </div>
  );
};

export default Crafting;
