import { useReducer } from 'react'
import { Input } from './input'
import { cn } from '@utils/cn'
import { Button } from './button'

export const SideBar = () => {
  const [open, setOpen] = useReducer(state => !state, false)

  return (
    <aside className={cn('border h-screen transition-all flex flex-col duration-150 relative', open ? 'w-1/4' : 'w-0')}>
      <Button
        variant="ghost"
        className="rounded-full p-0 w-12 h-12 absolute top-[40%] -right-6 bg-white "
        onClick={setOpen}>
        |||
      </Button>
      <div className={cn('relative  overflow-x-hidden w-full  ')}>
        <div className="flex justify-center items-center  border-b">
          <Input id="search" name="search" label="Buscar" />
        </div>
        <ul>
          <li>Perguntas</li>
        </ul>
      </div>
    </aside>
  )
}
