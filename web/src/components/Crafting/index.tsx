import { useMemo, useState } from 'react';
import { useAppSelector } from '../../store/store';
import Button from './Button';
import style from './index.module.css';
import { craftingItem } from '../../types/crafting';
import Item from './Item';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import { faMagnifyingGlass } from '@fortawesome/free-solid-svg-icons';

const Crafting = () => {
  const theme = useAppSelector((state) => state.config.theme);
  const crafting = useAppSelector((state) => state.crafting);
  const categories = useAppSelector((state) => state.ui.categories);
  const [craftingItems, setCraftingItems] = useState<craftingItem[]>([]);
  const [search, setSearch] = useState('');

  const buttonClick = (category: string) => {
    console.log('buttonClick', category);
    sortItems(category);
  };

  const isFave = (name: string) => {
    crafting.items.map((item) => {
      if (item.name == name) {
        return true;
      }
    });
    return false;
  };

  const sortItems = (category: string) => {
    let array: craftingItem[] = [];
    if (category === 'all') {
      array = crafting.items;
      setCraftingItems(array);
      return;
    }
    crafting.items.map((item: craftingItem) => {
      if (item.category === category) {
        array.push(item);
      }
    });
    setCraftingItems(array);
  };

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
        <div className={style.categories}>
          {categories.map((item, index) => {
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
              fontSize: '1.35vw',
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
        {craftingItems
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
                isFave={isFave(item.name)}
                id={item.id}
              />
            );
          })}
      </div>
    </div>
  );
};

export default Crafting;
