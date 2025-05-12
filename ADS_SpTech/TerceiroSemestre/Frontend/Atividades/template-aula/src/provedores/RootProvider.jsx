
import { createBrowserRouter, Outlet, RouterProvider } from 'react-router-dom'
import { ContainerBox } from '../componentes/ContainerBox'
import { ROUTERS } from '../constantes/routers'
import { Footer } from '../componentes/Footer'
import { SignUp } from '../paginas/signup/SignUp'
import { Login } from '../paginas/login/Login'
import { Home } from '../paginas/home/Home'

const router = createBrowserRouter([
  {
    element: <ContainerBox />,
    children: [
      {
        element: (
          <>
            <Outlet />
            <Footer />
          </>
        ),
        children: [
          { path: ROUTERS.HOME, element: <Home /> },
          { path: ROUTERS.LOGIN, element: <Login /> },
          { path: ROUTERS.SIGNUP, element: <SignUp /> }
        ]
      }
    ]
  }
])

export const RootProvider = () => <RouterProvider router={router} />
